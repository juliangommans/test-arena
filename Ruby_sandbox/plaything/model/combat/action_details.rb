class ActionDetails

  def initialize(action)
    @action = action
    @damage = 0
    @heal = 0
    @effect = ""
  end

  def action_type
    if @action[:type] == "damage"
      damage_action
    elsif @action[:type] == "heal"
      heal_action
    elsif @action[:type] == "utility"
      utility_action
    end
  end

  def damage_action
    if @action[:effect1].length > 0 && @action[:effect2] == ""
      @damage = @action[:power]
    else
      action_effects
    end
  end

  def heal_action
    if @action[:effect1].length > 0 && @action[:effect2] == ""
      @heal = @action[:power]
    else
      action_effects1
      action_effects2
    end
  end

  def action_effects1
    if @action[:effect1][0] == "buff"
      buff
    elsif @action[:effect1][0] == "debuff"
      debuff
    elsif @action[:effect1][0] == "dot"
      dot
    elsif @action[:effect1][0] == "hot"
      hot
    elsif @action[:effect1][0] == "cure"
      cure
    end
  end

  def cure
    if @action[:effect1][1] == "dot"
      @effect = remove_dot
    elsif @action[:effect1][1] == "debuff"
      @effect = remove_debuff
    end
  end

  def buff

  end

end
