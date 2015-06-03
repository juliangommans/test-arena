class ClassSuper
  attr_accessor :tot_hp, :tot_atk, :tot_def, :tot_eng, :tot_res, :tot_spd
  attr_accessor :hp, :atk, :def, :spd, :eng, :res, :ap
  # hp = Health Points, atk = Attack (corporeal), def = Defense
  # (corporeal), spd = Speed, eng = Energy (for ethereal damage and healing),
  # res = Resilience (ethereal defense), ap = Action Points
  attr_accessor :buffs, :debuffs, :name, :spec_1, :spec_2

  def initialize(name)
    @buffs = []
    @spec_1 = ""
    @spec_2 = ""
    @stats = []
    @name = name
    @ap = 4
  end

  def stat_reset
    @atk = @tot_atk
    @def = @tot_def
    @eng = @tot_eng
    @res = @tot_res
    @spd = @tot_spd
  end

  def hp_reset
    @hp = @tot_hp
  end

  def display_stats
    puts "#{@name}'s current stats are"
    puts "---------"
    puts "#{@hp.round(1)}/#{@tot_hp.to_i}: health"
    puts "#{@atk.round(1)}/#{@tot_atk.to_i}: attack"
    puts "#{@def.round(1)}/#{tot_def.to_i}: defense"
    puts "#{@eng.round(1)}/#{tot_eng.to_i}: energy"
    puts "#{@res.round(1)}/#{tot_res.to_i}: resilience"
    puts "#{@spd.round(1)}/#{tot_spd.to_i}: speed"
    puts "---------"
  end

  def set_specialization_1(spec)
    @spec_1 = spec
  end

  def set_specialization_2(spec)
    @spec_2 = spec
  end

end
