module CombatLogs

  def self.player_move_choice(player)
    puts "You available moves are as follows, please type which one you will use."
    player.move_list.each do |move|
      puts "#{move[:name]} deals #{move[:power].to_i} damage to your opponent."
    end
    @answer = gets.chomp
    answer_checker(player)
    return @answer.downcase
  end

  def self.answer_checker(player)
    @move_names = []
    get_move_names(player)
    until @move_names.include?(@answer.downcase.gsub(/\s+/, " "))
      puts "please enter a correct move name"
      @answer = gets.chomp
    end
  end

  def self.get_move_names(player)
    player.move_list.each do |move|
      @move_names.push(move[:name].downcase.gsub(/\s+/, " "))
    end
  end

  def self.log_hp(receiver)
    puts "#{receiver.name} now has #{receiver.hp.round(1)} health left."
  end

end
