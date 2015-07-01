class UtilityAction

  def find_effect(dealer, receiver, buff)
    if buff[:effect] == "reflect"
      reflect(dealer, buff)
    end
  end

  def reflect(dealer, buff)
    damage = buff[:power] * buff[:stacks]
    dealer.hp -= damage
    puts "#{dealer.name} has #{damage} damage reflected to them"
  end

  def sort_utilities(buff)
    if buff[:type] == "cure"
      cure(buff)
    end
  end

  def cure(buff)
    unless @combatants[0].buffs.length < 1
      removed_buff = select_buff_to_cure(buff)
      unless removed_buff == nil
        puts removed_buff
        puts "-- above = cured -- below = cure --"
        puts buff
        removed_buff[:stacks] -= buff[:stacks]
      end
    end
  end

  def select_buff_to_cure(new_buff)
    @combatants[0].buffs.shuffle
    @combatants[0].buffs.find { |buff| buff[:type] == new_buff[:stat] }
  end

end
