module Nature

  def self.get_nature(combatant, nature)
    if nature == "killer instinct"
      killer_instinct(combatant)
    elsif nature == "hibernation"
      hibernation(combatant)
    elsif nature == "agility"
      agility(combatant)
    elsif nature == "tough skin"
      tough_skin(combatant)
    else
      puts "could not find a nature"
    end
  end

  def self.killer_instinct(combatant)
    combatant.crit_power = 2
    combatant.atk = combatant.atk * 1.1
  end

  def self.hibernation(combatant)
    unless combatant.tot_hp <= combatant.hp && combatant.hp > 0
      combatant.hp += combatant.tot_hp * 0.05
      puts "you regenerate 5% of your health"
    end
  end

  def self.tough_skin(combatant)
    combatant.def = combatant.def * 1.1
    combatant.res = combatant.res * 1.1
  end

  def self.agility(combatant)
    combatant.spd = combatant.spd * 1.1
    combatant.eng = combatant.eng * 1.1
  end

end
