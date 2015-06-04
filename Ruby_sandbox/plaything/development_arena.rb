Dir['./**/*.rb'].each do |f|
  unless f == "./development_arena.rb"
    require f
  end
end

bob = Bear.new("ME")
steve = Tiger.new("opponent")
start = CombatInitialize.new(bob,steve)
#start.test
start.start


