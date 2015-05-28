require_relative 'class_super'

class Tiger < ClassSuper
  attr_reader :move_list

  def initialize(name)
    super
    @stats << @hp = 110.0
    @stats << @atk = 35.0
    @stats << @def = 25.0
    @stats << @spd = 30.0
    @move_list = [TierOneFireMoves.singe_1, TierOneFireMoves.molten_swipe_1, TierOneFireMoves.pyro_slap_1]
  end



  def set_specialization_1(spec)
    @spec_1 = spec
  end

  def set_specialization_2(spec)
    @spec_2 = spec
  end

end
