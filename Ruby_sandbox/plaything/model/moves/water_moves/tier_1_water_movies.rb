module TierOneWaterMoves

  def self.splash_1
    { name: "Splash",
      type: "heal",
      realm: "ethereal",
      element: "water",
      power: 15.0,
      cost: 2,
      effect1: [],
      effect2: "",
      cooldown: 2,
      cooldown_total: 2,
      rank: 1,
      tier: 1
    }
  end

  def self.douse_1
    { name: "Douse",
      type: "utility",
      realm: "ethereal",
      element: "water",
      power: 0,
      cost: 1,
      effect1: ["cure","dot",1,1,-1],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
    }
  end

  def self.squirt_1
    { name: "Squirt",
      type: "damage",
      realm: "ethereal",
      element: "water",
      power: 10.0,
      cost: 2,
      effect1: ["debuff","spd",-1,1,3],
      effect2: "",
      cooldown: 0,
      cooldown_total: 0,
      rank: 1,
      tier: 1
    }
  end

  def self.ice_slash_1
    { name: "Ice slash",
      type: "damage",
      realm: "corporeal",
      element: "water",
      power: 30.0,
      cost: 1,
      effect1: [],
      effect2: "",
      cooldown: 2,
      cooldown_total: 2,
      rank: 1,
      tier: 1
    }
  end

  def self.chill_blaines_1
    { name: "Chill blaines",
      type: "damage",
      realm: "ethereal",
      element: "water",
      power: 15,
      cost: 2,
      effect1: ["dot","hp",-2,1,3],
      effect2: "",
      cooldown: 1,
      cooldown_total: 1,
      rank: 1,
      tier: 1
    }
  end

  def self.icy_shard_1
    { name: "Icy Shard",
      type: "damage",
      realm: "corporeal",
      element: "water",
      power: 25,
      cost: 2,
      effect1: [],
      effect2: "",
      cooldown: 0,
      cooldown_total: 0,
      rank: 1,
      tier: 1
    }
  end

end
