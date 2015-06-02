class CreateBuff

  def initialize(action)
    @action = action
    build_buff
  end

  def build_buff
    placeholder = Hash.new
    placeholder[:name] = @action[:name]
    placeholder[:type] = @action[:effect1][0]
    placeholder[:stat] = @action[:effect1][1]
    placeholder[:amount] = @action[:effect1][2]
    placeholder[:stacks] = @action[:effect1][3]
    placeholder[:duration] = @action[:effect1][4]
    create_buff(placeholder)
  end

  def create_buff(placeholder)
    instance_variable_set("@#{@action[:name]}", placeholder)
  end

  def buff
    instance_variable_get("@#{@action[:name]}")
  end

end

 squirt_1 = { name: "Squirt",
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

steve = CreateBuff.new(squirt_1)
bob = []
bob << steve.buff
print bob
