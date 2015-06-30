module TierOneAirMoves

  def self.static_skin_1
    @var = { name: "Static Skin",
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
    @var = { name: "Electric Touch",
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
    @var = { name: "Wind Blast",
        type: "damage",
        realm: "ethereal",
        element: "air",
        power: 25,
        cost: 2,
        effect1: ["debuff","res",-1,1,3],
        effect2: "",
        cooldown: 2,
        cooldown_total: 2,
        rank: 1,
        tier: 1
        }
  end

  def self.wind_blast_1
    @var = { name: "Wind Blast",
        type: "damage",
        realm: "ethereal",
        element: "air",
        power: 25,
        cost: 2,
        effect1: ["debuff","res",-1,1,3],
        effect2: "",
        cooldown: 2,
        cooldown_total: 2,
        rank: 1,
        tier: 1
        }
  end

end
