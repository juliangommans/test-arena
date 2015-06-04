require_relative "./buffs/create_buff.rb"

class ActionDetails

  attr_reader :action_power, :target, :current_action_buff, :action

  def initialize(action)
    @target = 0 # 1 = opponent, 0 = self
    @action = action
    @action_power = 0
    @current_action_buff = nil
    action_type
  end

  def action_type
    if @action[:type] == "damage"
      @target = 1
      damage_action
    elsif @action[:type] == "heal"
      @target = 0
      heal_action
    elsif @action[:type] == "utility"
      utility_effects
    end
  end

  def damage_action
    @action_power -= @action[:power]
    if @action[:effect1].length > 1 || @action[:effect2] != ""
      action_effects
    end
  end

  def heal_action
    @action_power += @action[:power]
    if @action[:effect1].length > 1 || @action[:effect2] != ""
      action_effects
    end
  end

  def action_effects
    @current_action_buff = CreateBuff.new(@action)
    set_buff_target
  end

  def set_buff_target
    if @action[:effect1][0] == "buff" || @action[:effect1][0] == "hot"
      @target = 0
    elsif @action[:effect1][0] == "debuff" || @action[:effect1][0] == "dot"
      @target = 1
    elsif @action[:effect1][0] == "cure"
      @target = 0
    end
  end

  def utility_effects
    @current_action_buff = CreateBuff.new(@action)
    set_buff_target
  end



end
