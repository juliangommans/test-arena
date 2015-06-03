class UtilityAction

  def find_effect(buff)
    if buff[:effect] == "reflect"
      reflect(buff)
    end
  end

  def reflect(buff)
    damage = buff[:power] * buff[:stacks]
    @combatants[0].hp -= damage
    puts "#{@combatants[0].name} has #{damage} damage reflected to them"
  end

end
