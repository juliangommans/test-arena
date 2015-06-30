require_relative 'class_super'

class Bear < ClassSuper
  attr_reader :move_list

  def initialize(name)
    super
    @stats << @hp = 120.0
    @stats << @atk = 30.0
    @stats << @def = 35.0
    @stats << @spd = 20.0
    @stats << @eng = 15.0
    @stats << @res = 30.0
    @move_list = [TierOneFireMoves.singe_1, TierOneFireMoves.warmth_1, TierOneFireMoves.firey_shell_1, TierOneFireMoves.molten_swipe_1, TierOneFireMoves.pyro_slap_1, TierOneFireMoves.lava_jet_1]
    set_total_stats
  end

  def set_total_stats
    @tot_hp = @hp
    @tot_atk = @atk
    @tot_def = @def
    @tot_eng = @eng
    @tot_res = @res
    @tot_spd = @spd
  end

end

