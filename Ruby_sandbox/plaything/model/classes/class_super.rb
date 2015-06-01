class ClassSuper
  attr_accessor :tot_hp, :tot_atk, :tot_def, :tot_spd
  attr_accessor :hp, :atk, :def, :spd
  attr_accessor :buffs, :debuffs, :name

  def initialize(name)
    @buffs = []
    @debuffs = []
    @spec_1 = ""
    @spec_2 = ""
    @stats = []
    @name = name
    @action_points = 4
    set_total_stats
  end

  def set_total_stats
    @tot_hp = @hp
    @tot_atk = @atk
    @tot_def = @def
    @tot_spd = @spd
  end

  def stat_reset
    @hp = @tot_hp
    @atk = @tot_atk
    @def = @tot_def
    @spd = @tot_spd
  end

  def display_stats
    puts "#{@name}'s current stats are"
    puts "---------"
    puts "#{@hp}/#{@tot_hp}: health"
    puts "#{@atk}/#{@tot_atk}: attack"
    puts "#{@def}/#{tot_def}: defense"
    puts "#{@spd}/#{tot_spd}: speed"
    puts "---------"
  end

end
