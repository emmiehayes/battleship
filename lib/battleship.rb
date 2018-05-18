# this class handles the initial repl
# to refactor- all message strings will be pulled out and put into methods in
# a module called messages....methods will be called in the place of the strings
# for readability.
# will also clear screen between each interaction- add in feature when refactoring


require './lib/play'

class Battleship
  puts 'Welcome to BATTLESHIP.
  Would you like to (p)lay, read the (i)nstructions, or (q)uit?'

  def start_game_sequence
    user_input = gets.chomp.downcase.strip
    until user_input == 'q' || user_input == 'quit'
      if user_input == 'p' || user_input == 'play'
        puts 'Initial game message will go here'
        # Play.new.start_placements
      elsif user_input == 'i' || user_input == 'instructions'
        puts 'Instructional message will go here'
      end
      user_input = gets.chomp.downcase.strip
    end
    puts 'Thank you for playing.'
  end
end

def end_game_sequence
# When either the player or computer win the game…
# Output a sorry or congratulations message
# Output how many shots it took the winner to sink the opponent’s ships
# Output the total time that the game took to play
end
