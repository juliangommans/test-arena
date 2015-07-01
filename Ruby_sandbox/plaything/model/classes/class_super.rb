# Dir['../passives/*.rb'].each do |f|
#     require_relative f
# end
# require_relative "../passives/nature.rb"

class ClassSuper #< Nature
  attr_accessor :tot_hp, :tot_atk, :tot_def, :tot_eng, :tot_res, :tot_spd
  attr_accessor :hp, :atk, :def, :spd, :eng, :res, :ap, :passives
  # hp = Health Points, atk = Attack (corporeal), def = Defense
  # (corporeal), spd = Speed, eng = Energy (for ethereal damage and healing),
  # res = Resilience (ethereal defense), ap = Action Points
  attr_accessor :buffs, :name, :nature, :spec_2, :cooldowns, :crit_chance, :combo_points, :crit_power

  def initialize(name)
    @passives = []
    @buffs = []
    @cooldowns = []
    @stats = []
    @name = name
    @ap = 4
    @crit_power = 1.5
    @crit_chance = 0
    @combo_points = 0
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

  def set_nature(nature)
    @passives.push(nature)
  end

  def set_specialization_2(spec)
    @spec_2 = spec
  end

end
