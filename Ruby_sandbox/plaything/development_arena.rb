Dir['./**/*.rb'].each do |f|
  unless f == "./development_arena.rb"
    require f
  end
end

bob = Bear.new("ME")
bob.set_nature("hibernation")
steve = Tiger.new("opponent")
steve.set_nature("killer instinct")
start = CombatInitialize.new(bob,steve)
start.start


