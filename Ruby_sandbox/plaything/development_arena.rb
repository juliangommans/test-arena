Dir['./**/*.rb'].each do |f|
  unless f == "./development_arena.rb"
    require f
  end
end

bob = Bear.new("lol")
steve = Tiger.new("boo")
start = Combat.new(bob,steve)
#start.test
start.start


