module TierOneFireMoves

  def self.singe_1
    @singe_1 = { name: "Singe",
        type: "damage",
        realm: "ethereal",
        element: "fire",
        power: 10.0,
        cost: 2,
        effect1: ["dot", "hp", -1, 1, 3],
        effect2: "",
        cooldown: 1,
        cooldown_total: 1,
        rank: 1,
        tier: 1
        }
  end

  def self.warmth_1
    @warmth_1 = { name: "Warmth",
        type: "heal",
        realm: "ethereal",
        element: "fire",
        power: 5.0,
        cost: 1,
        effect1: [],
        effect2: "",
        cooldown: 0,
        cooldown_total: 0,
        rank: 1,
        tier: 1
        }
  end

  def self.firey_shell_1
    @firey_shell_1 = { name: "Firey shell",
        type: "utility",
        realm: "ethereal",
        element: "fire",
        power: 3,
        cost: 3,
        effect1: ["buff", "def", 1, 1, 3],
        effect2: "reflect",
        cooldown: 2,
        cooldown_total: 2,
        rank: 1,
        tier: 1
      }
  end

  def self.molten_swipe_1
    @molten_swipe_1 = { name: "Molten swipe",
        type: "damage",
        realm: "corporeal",
        element: "fire",
        power: 15.0,
        cost: 2,
        effect1: ["debuff", "def", -1, 1, 3],
        effect2: "",
        cooldown: 0,
        cooldown_total: 0,
        rank: 1,
        tier: 1
      }
  end

  def self.pyro_slap_1
    @pyro_slap_1 = { name: "Pyro slap",
        type: "damage",
        realm: "corporeal",
        element: "fire",
        power: 25.0,
        cost: 3,
        effect1: [],
        effect2: "",
        cooldown: 1,
        cooldown_total: 1,
        rank: 1,
        tier: 1
      }
  end

end

