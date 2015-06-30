require_relative 'class_super'

class Eagle < ClassSuper
  attr_reader :move_list

  def initialize(name)
    super
    @stats << @hp = 100.0
    @stats << @atk = 30.0
    @stats << @def = 20.0
    @stats << @spd = 35.0
    @stats << @eng = 45.0
    @stats << @res = 20.0
    @move_list = [TierOneAirMoves.static_skin_1, TierOneAirMoves.electric_touch_1, TierOneAirMoves.wind_blast_1, TierOneAirMoves.soothing_breeze_1, TierOneAirMoves.static_shock_1, TierOneAirMoves.thunder_rush_1]
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
