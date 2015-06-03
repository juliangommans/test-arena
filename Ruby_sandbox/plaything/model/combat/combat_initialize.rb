require_relative '../../view/combat/combat_logs.rb'
require_relative "./action_details.rb"

class CombatInitialize

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
      puts "========"
      puts "Final stat summary"
      puts "========"
    stat_summary
  end

  def finish
    @player.stat_reset
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
    @move = ActionDetails.new(dealer.move_list.sample)
    # action_points_checker(dealer,receiver)
    dealer.ap -= @move.action[:cost]
    unless @move.current_action_buff == nil
      buff_update
    end
    @action_power = @move.action_power
    heal_or_damage(dealer, receiver)
  end



  # def action_points_checker(dealer)
  #   dealer.ap <= @move.action[:cost]
  # end

  ########### HEAL/DAMAGE OF ACTION ###########

  def heal_or_damage(dealer, receiver)
    if @move.action[:type] == "damage"
      damage_dealt(dealer, receiver)
    elsif @move.action[:type] == "heal"
      heal(dealer)
    else
      puts "#{@move.action[:name]} is a u(seless)tility ability"
    end
  end

  def damage_dealt(dealer, receiver)
    if @move.action[:realm] == "ethereal"
      total_damage = @action_power * (dealer.eng/receiver.res)
    else
      total_damage = @action_power * (dealer.atk/receiver.def)
    end
    receiver.hp += total_damage
    print "#{dealer.name} used #{@move.action[:name]}: "
    puts "#{receiver.name} took #{(total_damage * -1).round(1)} #{@move.action[:realm]} damage"
    CombatLogs.log_hp(receiver)
    puts "-------------------"
  end

  def heal(dealer)
    total_healing = (@action_power * (dealer.eng/((dealer.def+dealer.res)/2)))
    dealer.hp += total_healing
    print "#{dealer.name} used #{@move.action[:name]}: "
    puts "#{dealer.name} received #{total_healing.round(1)} health"
    CombatLogs.log_hp(dealer)
    puts "-------------------"
  end

  ########### BUFFS ###########
  def buff_finder?
    @combatants[@move.target].buffs.find {|buff| @move.current_action_buff.buff[:name]}
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
  ########### Resolving ###########
  def resolve_round
    @combatants.each do |combatant|
      combatant.ap = 4
      combatant.stat_reset
      puts "#{combatant.name} #{combatant.buffs}"
    end
  end

  def resolve_buffs
    if @combatants
      @combatants.each do |combatant|
        expired_buffs(combatant)
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
    combatant.buffs.delete_if {|buff| buff[:duration] == 0}
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
