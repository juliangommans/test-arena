require 'active_support/core_ext'

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
    placeholder[:effect] = @action[:effect2]
    placeholder[:power] = @action[:power]
    create_buff(placeholder)
  end

  def create_buff(placeholder)
    instance_variable_set("@#{@action[:name].gsub(' ','_')}", placeholder)
  end

  def buff
    instance_variable_get("@#{@action[:name].gsub(' ','_')}")
  end

end
