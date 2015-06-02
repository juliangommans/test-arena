require_relative '../../view/combat/combat_logs.rb'
require_relative "./action_details.rb"

class CombatInitialize

  def initialize(player,opponent)
    @player = player
    @opponent = opponent
    @action_power = 0
    @round = 0
    @player_stats = {
      "hp" => @player.hp,
      "atk" => @player.atk,
      "def" => @player.def,
      "eng" => @player.eng,
      "res" => @player.res,
      "spd" => @player.spd
    }
  end

  def start
    #until victory? || defeat?
    2.times do
      @round += 1
      turn(fastest)
      puts "========"
      puts "End of round #{@round}"
      puts "========"
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
          buff[:amount] += @move.current_action_buff.buff[:amount]
        end
      end
    end
    buff_checker
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
      realm_type = "ethereal"
    else
      total_damage = @action_power * (dealer.atk/receiver.def)
      realm_type = "corporeal"
    end
    receiver.hp += total_damage
    print "#{dealer.name} used #{@move.action[:name]}: "
    puts "#{receiver.name} took #{(total_damage * -1).round(1)} #{realm_type} damage"
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
    @combatants.each do |combatant|
      combatant.buffs.each do |buff|
        combatant.hp += (buff[:stacks]*buff[:amount]) if buff[:stat] == "hp"
        buff[:duration] -= 1
      end
    end
  end

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
