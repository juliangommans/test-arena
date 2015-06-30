module ThisMoveList

  def move
    { name: "",
      type: "",
      realm: "",
      element: "",
      power: 0,
      cost: 0,
      effect1: ["","",0,0,0],
      effect2: "",
      cooldown: 0,
      cooldown_total: 0,
      rank: 0,
      tier: 0
    }
  end

end

#### Name = move name
#### Realm = "corporeal"(physical) or "ethereal"(special) i.e. what stats
#### the move uses and multiplies/divides by
#### Type = damage, heal or utility
#### Element = which element
#### Power = amount of damage or healing done
#### Cost = AP expense of move
#### Effect1 = "overtime" effect - if .length = 0 ignore.
#format = ["effect"(eg dot/debuff),
#          "secondary effect"(eg element if dot, stat if debuff etc.),
#          "value" (eg, if a dot/hot/lowering a stat, how much?),
#          "move-rank/stacks applied"(eg stack count, max 5),
#          "duration"(eg how many turns it will last - recasting refreshes)
#           ]
#### Effect2 = custom effect
#### Cooldown = how many turns till used again, 0 means as many times
#as you can in a turn, 1 means once a turn, 2 = every second turn etc.
#### Cooldown_total = what the cooldown resets too
#### Rank = what rank this ability is
#(player can rank up several abilities twice i.e. to 3)
#### Tier = what teir it falls into, 1 - 2 - 3
