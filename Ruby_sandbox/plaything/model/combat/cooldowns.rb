module Cooldowns

  def self.find_move(combatant, selected_move)
    combatant.move_list.find { |move| move[:name] == selected_move[:name] }
  end

  def self.find_cd(combatant, selected_move)
    combatant.cooldowns.find { |move| move[:name] == selected_move[:name] }
  end

  def self.on_cd(combatant, selected_move)
    combatant.cooldowns.push(find_move(combatant, selected_move))
    combatant.move_list.delete(find_move(combatant, selected_move))
    puts "#{selected_move[:name]} is now on cooldown for #{selected_move[:cooldown]} turns"
  end

  def self.return_cd(combatant, selected_move)
    combatant.move_list.push(find_cd(combatant, selected_move))
  end

  def self.off_cd(combatant)
    combatant.cooldowns.delete_if do |cd|
      cd[:cooldown] <= 1
    end
  end

  def self.reset_cd(combatant, selected_move)
    move = find_move(combatant, selected_move)
    move[:cooldown] = move[:cooldown_total]
  end

  def self.check_cds(combatant)
    combatant.cooldowns.each do |cd|
      puts "this cooldown #{cd[:name]} is currently on cooldown for #{cd[:cooldown]} turns"
      if cd[:cooldown] <= 1
        return_cd(combatant, cd)
        reset_cd(combatant, cd)
        puts "#{cd[:name]} is now off cooldown"
      else
        cd[:cooldown] -= 1
        puts "#{cd[:name]} now has #{cd[:cooldown]} turns left"
      end
    end
    off_cd(combatant)
  end

  def self.cooldown(combatant, move)
    on_cd(combatant, move) if move[:cooldown] > 0
  end

end
