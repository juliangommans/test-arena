module TierOneFireMoves

  def self.singe_1
    @singe_1 = { name: "Singe",
        type: "damage",
        element: "fire",
        power: 10.0,
        cost: 2,
        effect1: ["dot", "fire", 1, 1, 3],
        effect2: "",
        cooldown: 1,
        rank: 1,
        tier: 1
        }
  end

  def self.warmth_1
    @warmth_1 = { name: "Warmth",
        type: "heal",
        element: "fire",
        power: 5.0,
        cost: 1,
        effect1: [],
        effect2: "",
        cooldown: 0,
        rank: 1,
        tier: 1
        }
  end

  def self.firey_shell_1
    @firey_shell_1 = { name: "Firey shell",
        type: "utility",
        element: "fire",
        power: 3.0,
        cost: 3,
        effect1: ["buff", "reflect", 1, 1, 3],
        effect2: "",
        cooldown: 2,
        rank: 1,
        tier: 1
      }
  end

  def self.molten_swipe_1
    @molten_swipe_1 = { name: "Molten swipe",
        type: "damage",
        element: "fire",
        power: 15.0,
        cost: 2,
        effect1: ["debuff", "def", 1, 1, 3],
        effect2: "",
        cooldown: 0,
        rank: 1,
        tier: 1
      }
  end

  def self.pyro_slap_1
    @pyro_slap_1 = { name: "Pyro slap",
        type: "damage",
        element: "fire",
        power: 25.0,
        cost: 3,
        effect1: [],
        effect2: "",
        cooldown: 1,
        rank: 1,
        tier: 1
      }
  end

end

