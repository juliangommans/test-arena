require_relative '../../view/combat/combat_logs.rb'
require_relative "./action_details.rb"
require_relative "./buffs/utility_action.rb"
require_relative "./cooldowns.rb"


class CombatInitialize < UtilityAction

  def initialize(player,opponent)
    @player = player
    @opponent = opponent
    @action_power = 0
    @round = 0
  end

  def start
    #until victory? || defeat?
    3.times do
      @round += 1
      resolve_buffs
      stat_summary
      puts "========"
      puts "Beggining of round #{@round}"
      puts "========"
      turn(fastest)
      puts "========"
      puts "End of round #{@round}"
      puts "========"
      resolve_round
    end
      resolve_buffs
      puts "========"
      puts "Final stat summary"
      puts "========"
    stat_summary
  end

  def finish
    @combatants.each do |combatant|
      combatant.stat_reset
      combatant.hp_reset
    end
  end

  def fastest
    if @player.spd > @opponent.spd
      return [@player, @opponent]
    elsif @opponent.spd > @player.spd
      return [@opponent, @player]
    else
      return rand(2) == 1 ? [@player, @opponent] : [@opponent, @player]
    end
  end

  def turn(players)
    until players[0].ap < 1 && players[1].ap < 1
      unless players[0].ap < 1
        each_combatant_turn(players[0],players[1])
      end
      unless players[1].ap < 1
        each_combatant_turn(players[1],players[0])
      end
    end
  end

  def each_combatant_turn(dealer,receiver)
    @combatants = [dealer,receiver]
    #@move = ActionDetails.new(dealer.move_list.sample)
    action_points_checker(dealer)
  end

  def after_move_select
     @combatants[0].ap -= @move.action[:cost]
    unless @move.current_action_buff == nil
      buff_update
    end
    Cooldowns.cooldown(@combatants[0], @move.action)
    @action_power = @move.action_power
    heal_or_damage
  end

  def action_points_checker(dealer)
    if select_move(dealer) == nil
      dealer.ap -= 4
    else
      @move = ActionDetails.new(select_move(dealer))
      after_move_select
    end
    # until dealer.ap >= @move.action[:cost]
    #   @move = ActionDetails.new(dealer.move_list.sample)
    #   puts "#{@move.action[:name]} costs: #{@move.action[:cost]} ap"
    #   puts "*****************"
    # end
  end

  def select_move(dealer)
    random_move = dealer.move_list.shuffle
    selected = random_move.find { |move| move[:cost] <= dealer.ap }
    return selected
  end

  ########### HEAL/DAMAGE OF ACTION ###########

  def heal_or_damage
    if @move.action[:type] == "damage"
      damage_dealt
    elsif @move.action[:type] == "heal"
      heal
    else
      utility_checker
    end
  end

  def damage_dealt
    if @move.action[:realm] == "ethereal"
      total_damage = @action_power * ((@combatants[0].eng/@combatants[1].res)/2)
    else
      total_damage = @action_power * ((@combatants[0].atk/@combatants[1].def)/2)
    end
    @combatants[1].hp += total_damage
    print "#{@combatants[0].name} used #{@move.action[:name]}: "
    puts "#{@combatants[1].name} took #{(total_damage * -1).round(1)} #{@move.action[:realm]} damage"
    CombatLogs.log_hp(@combatants[1])
    puts "-------------------"
    check_secondary_effects
  end

  def heal
    total_healing = (@action_power * (@combatants[0].eng/((@combatants[0].def+@combatants[0].res)/2)))
    @combatants[0].hp += total_healing
    print "#{@combatants[0].name} used #{@move.action[:name]}: "
    puts "#{@combatants[0].name} received #{total_healing.round(1)} health"
    CombatLogs.log_hp(@combatants[0])
    puts "-------------------"
  end

  ########### BUFFS ###########
  def buff_finder?
    @combatants[@move.target].buffs.any? {|h| h[:name] == @move.current_action_buff.buff[:name]}
  end

  def buff_checker
    unless buff_finder?
       @combatants[@move.target].buffs.push(@move.current_action_buff.buff)
    end
  end

  def buff_update
    @combatants[@move.target].buffs.each do |buff|
      if @move.current_action_buff.buff[:name] == buff[:name]
        if buff[:stacks] < 5
          buff[:stacks] += @move.current_action_buff.buff[:stacks]
            buff[:stacks] = 5 if buff[:stacks] > 5
          buff[:duration] = @move.current_action_buff.buff[:duration]
        end
      end
    end
    buff_checker
  end

  def utility_checker
    sort_utilities(@move.current_action_buff.buff)
    puts "#{@combatants[0].name} used #{@move.action[:name]}: "
    puts "-------------------"
  end

  def check_secondary_effects
    @combatants.each do |combatant|
      combatant.buffs.each do |buff|
        unless buff[:effect].length < 1
          find_effect(buff)
        end
      end
    end
  end

  ########### Resolving ###########
  def resolve_round
    @combatants.each do |combatant|
      combatant.ap = 4
      combatant.stat_reset
      puts "---- #{combatant.name} CDS -----"
      puts combatant.cooldowns
      puts "---- #{combatant.name} MOVES -----"
      puts combatant.move_list
      puts " ________________________"
      Cooldowns.check_cds(combatant)
      puts " ________________________"
    end
  end

  def resolve_buffs
    if @combatants
      @combatants.each do |combatant|
        expired_buffs(combatant)
        # print "#{combatant.name}"
        # puts combatant.buffs
        # puts " "
        combatant.buffs.each do |buff|
          resolve_dots(combatant,buff)
          resolve_stat_buffs(combatant,buff)
          buff[:duration] -= 1
        end
      end
    end
  end

  def resolve_stat_buffs(combatant,buff)
    if buff[:stat] == "atk"
      combatant.atk += (buff[:stacks]*buff[:amount])
    elsif buff[:stat] == "def"
      combatant.def += (buff[:stacks]*buff[:amount])
    elsif buff[:stat] == "eng"
      combatant.eng += (buff[:stacks]*buff[:amount])
    elsif buff[:stat] == "res"
      combatant.res += (buff[:stacks]*buff[:amount])
    elsif buff[:stat] == "spd"
      combatant.spd += (buff[:stacks]*buff[:amount])
    end
  end

  def resolve_dots(combatant,buff)
    combatant.hp += (buff[:stacks]*buff[:amount]) if buff[:stat] == "hp"
  end

  def expired_buffs(combatant)
    combatant.buffs.delete_if {|buff| buff[:duration] < 0}
    combatant.buffs.delete_if {|buff| buff[:stacks] < 1}
  end

  ########### ALL PURPOSE ###########

  def victory?
    @opponent.hp < 1
  end

  def defeat?
    @player.hp < 1
  end

  def stat_summary
    @player.display_stats
    @opponent.display_stats
  end

end
