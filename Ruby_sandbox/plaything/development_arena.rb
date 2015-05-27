Dir['./**/*.rb'].each{ |f| require f }


bob = Bear.new("lol")
bob.display_stats
puts bob.name
bob.move_list.each do |x|
  puts x
end
