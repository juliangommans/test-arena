module TierOneWaterMoves

  def self.splash_1
    @splash_1 = { name: "Splash",
        type: "heal",
        element: "water",
        power: 15.0,
        cost: 2,
        effect1: [],
        effect2: "",
        cooldown: 1,
        rank: 1,
        tier: 1
        }
  end

  def self.douse_1
    @douse_1 = { name: "Douse",
        type: "utility",
        element: "water",
        power: 0,
        cost: 1,
        effect1: ["cure","dot",1,1,0],
        effect2: "",
        cooldown: 1,
        rank: 1,
        tier: 1
        }
  end

  def self.squirt_1
    @squirt_1 = { name: "Squirt",
        type: "damage",
        element: "water",
        power: 5.0,
        cost: 2,
        effect1: ["debuff","spd",1,1,3],
        effect2: "",
        cooldown: 0,
        rank: 1,
        tier: 1
        }
  end

  def self.ice_slash_1
    @ice_slash_1 = { name: "Ice slash",
        type: "damage",
        element: "water",
        power: 30.0,
        cost: 2,
        effect1: [],
        effect2: "",
        cooldown: 2,
        rank: 1,
        tier: 1
        }
  end

  def self.chill_blaines_1
    @chill_blaines_1 = { name: "Chill blaines",
        type: "damage",
        element: "water",
        power: 10,
        cost: 3,
        effect1: ["dot","water",2,1,3],
        effect2: "",
        cooldown: 1,
        rank: 1,
        tier: 1
        }
  end

end
