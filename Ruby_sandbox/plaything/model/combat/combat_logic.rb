require_relative '../../view/combat/combat_logs.rb'

class Combat

  def initialize(player,opponent)
    @player = player
    @opponent = opponent
    @damage = 0
  end

  def start
    until victory? || defeat?
      who = fastest
      turn(who[0])
      turn(who[1])
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

  def turn(combatant)
    if combatant == @opponent
      @damage = @opponent.move_list.sample[:power]
      damage_dealt(@opponent, @player)
    else
      move = CombatLogs.player_move_choice(@player)
      p "============"
      p move
      p "============"
      @damage = move
    end
  end

  def damage_dealt(dealer, receiver)
    total_damage = @damage * (dealer.atk/receiver.def)
    receiver.hp -= total_damage
    CombatLogs.log_hp(receiver)
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
