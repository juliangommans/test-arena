class Nature

  def get_nature(combatant)
    if combatant.nature == "killer instinct"
      killer_instinct(combatant)
    elsif combatant.nature == "hibernation"
      hibernation(combatant)
    else
      puts "could not find a nature"
    end
  end

  def killer_instinct(combatant)
    combatant.crit_power = 2
    combatant.atk = combatant.tot_atk * 1.1
  end

  def hibernation(combatant)
    unless combatant.tot_hp <= combatant.hp
      combatant.hp += combatant.tot_hp * 0.05
      puts "you regenerate 5% of your health"
    end
  end

end
