Dir['../**/*.rb'].each{ |f| require f }

class Bear < Class_Super
  attr_reader :move_list

  def initialize(name)
    super
    @stats = []
    @stats << @hp = 120
    @stats << @atk = 30
    @stats << @def = 30
    @stats << @spd = 20
    @move_list = [@singe_1, @warmth_1, @firey_shell_1, @molten_swipe_1, @pyro_slap_1]
  end

end
