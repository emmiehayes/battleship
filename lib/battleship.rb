require './lib/play'

class Battleship
  puts 'Welcome to BATTLESHIP.
  Would you like to (p)lay, read the (i)nstructions, or (q)uit?'

  def start_sequence
    user_input = gets.chomp.downcase.strip
    until user_input == 'q' || user_input == 'quit'
      if user_input == 'p' || user_input == 'play'
        puts "Initial game message will go here"
        # Play.new.start_game
      elsif user_input == 'i' || user_input == 'instructions'
        puts "Instructional message will go here"
      end
      user_input = gets.chomp.downcase.strip
    end
    puts "Thank you for playing."
  end
end
