require_relative "./../create_buff.rb"

class ActionDetails

  attr_reader :action_power, :target, :current_action_buff, :realm

  def initialize(action)
    @target = 0 # 1 = opponent, 0 = self
    @realm = action[:realm]
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
      utility_action
    end
  end

  def damage_action
    if @action[:effect1].length < 1 && @action[:effect2] == ""
      @action_power -= @action[:power]
    else
      action_effects1
      action_effects2
    end
  end

  def heal_action
    if @action[:effect1].length < 1 && @action[:effect2] == ""
      @action_power += @action[:power]
    else
      action_effects1
      action_effects2
    end
  end

  def action_effects1
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
      cure(@current_action_buff)
    end
  end

  def action_effects2

  end

  def cure(buff)
    if buff.buff[:stat] == "dot"
      remove_dot(@target)
    elsif buff.buff[:stat] == "debuff"
      remove_debuff(@target)
    end
  end



end
