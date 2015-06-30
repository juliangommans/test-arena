require_relative 'class_super'

class ClassName < ClassSuper
  attr_reader :move_list

  def initialize(name)
    super
## always total 250 (for now)
    @stats << @hp = 100.0
    @stats << @atk = 30.0
    @stats << @def = 30.0
    @stats << @spd = 30.0
    @stats << @eng = 30.0
    @stats << @res = 30.0
    @move_list = []
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
