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
    2.times do
      @round += 1
      who = fastest
      turn(who)
      puts "End of round #{@round}"
      resolve_round
    end
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

  def turn(combatants)
    until combatants[0].ap < 1 && combatants[1].ap < 1
      unless combatants[0].ap < 1
        each_combatant_turn(combatants[0],combatants[1])
      end
      unless combatants[1].ap < 1
        each_combatant_turn(combatants[1],combatants[0])
      end
    end
  end

  def each_combatant_turn(dealer,receiver)
    combatants = [dealer,receiver]
    @move = ActionDetails.new(dealer.move_list.sample)
    # action_points_checker(dealer,receiver)
    dealer.ap -= @move.action[:cost]
    unless @move.current_action_buff == nil
      combatants[@move.target].buffs.push(@move.current_action_buff.buff)
    end
    @action_power = @move.action_power
    heal_or_damage(dealer, receiver)
  end

  # def action_points_checker(dealer)
  #   dealer.ap <= @move.action[:cost]
  # end

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
    puts "#{receiver.name} took #{(total_damage * -1).round(1)} damage"
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

  def resolve_round
      puts @player.buffs
      resolve_buffs
      @opponent.ap = 4
      @player.ap = 4
  end

  def resolve_buffs
    @player.buffs.each do |buff|


      #@player.instance_variable_get("@#{buff[:stat]}") += (buff[:stacks]*buff[:amount])
    end
  end

  # def options

  # end

  def victory?
    @opponent.hp < 1
  end

  def defeat?
    @player.hp < 1
  end

  def test
    @player.move_names.each do |x|
      puts x
    end
    @opponent.display_stats
  end

end
