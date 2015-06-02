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
    until victory? || defeat?
      @round += 1
      who = fastest
      turn(who)
      turn(who)
      puts "End of round #{@round}"
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
    each_combatant_turn(combatants[0],combatants[1])
    each_combatant_turn(combatants[1],combatants[0])
  end

  def each_combatant_turn(dealer,receiver)
    combatants = [dealer,receiver]
    @move = ActionDetails.new(dealer.move_list.sample)
    unless @move.current_action_buff == nil
      combatants[@move.target].buffs.push(@move.current_action_buff)
    end
    @action_power = @move.action_power
    damage_dealt(dealer, receiver)
  end

  def heal_or_damage(dealer, receiver)
    if @move.target == 1
      damage_dealt(dealer, receiver)
    else
      heal(dealer)
    end
  end

  def damage_dealt(dealer, receiver)
    if @move.realm == ethereal
      total_damage = @action_power * (dealer.eng/receiver.res)
    else
      total_damage = @action_power * (dealer.atk/receiver.def)
    end
    receiver.hp += total_damage
    CombatLogs.log_hp(receiver)
  end

  def heal(dealer)
    total_healing = (@action_power * (dealer.energy/((dealer.def+dealer.res)/2)))
    dealer.hp += total_healing
    CombatLogs.log_hp(dealer)
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
