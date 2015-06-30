module TierOneAirMoves

  def self.static_skin_1
    { name: "Static skin",
      type: "utility",
      realm: "corporeal",
      element: "",
      power: 3,
      cost: 3,
      effect1: ["buff","res",1,1,3],
      effect2: "reflect",
      cooldown: 2,
      cooldown_total: 2,
      rank: 1,
      tier: 1
    }
  end

  def self.electric_touch_1
    { name: "Electric touch",
      type: "damage",
      realm: "corporeal",
      element: "air",
      power: 10,
      cost: 1,
      effect1: ["buff","atk",1,1,3],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
      }
  end

  def self.wind_blast_1
    { name: "Wind blast",
      type: "damage",
      realm: "ethereal",
      element: "air",
      power: 25,
      cost: 3,
      effect1: ["debuff","res",-2,1,3],
      effect2: "",
      cooldown: 2,
      cooldown_total: 2,
      rank: 1,
      tier: 1
    }
  end

  def self.soothing_breeze_1
    { name: "Soothing breeze",
      type: "heal",
      realm: "ethereal",
      element: "air",
      power: 10,
      cost: 2,
      effect1: ["hot","hp",1,1,3],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
    }
  end

  def self.static_shock_1
    { name: "Static shock",
      type: "damage",
      realm: "ethereal",
      element: "air",
      power: 15,
      cost: 1,
      effect1: [],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
    }
  end

  def self.thunder_rush_1
    { name: "Thunder rush",
      type: "damage",
      realm: "corporeal",
      element: "air",
      power: 10,
      cost: 2,
      effect1: ["buff","spd",2,1,3],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
    }
  end

end
