# this class handles the initial repl
require './lib/responder'

class Battleship
  extend Responder
  include Responder

  welcome_message

  def start_game_sequence
    user_input = gets.chomp.downcase.strip
    until user_input == 'q' || user_input == 'quit'
      if user_input == 'p' || user_input == 'play'
        Play.new.computer_place_your_ships
      elsif user_input == 'i' || user_input == 'instructions'
        instructional_message
      end
      user_input = gets.chomp.downcase.strip
    end
    end_game_message
  end

# def end_game_sequence
# # When either the player or computer win the game…
# # Output a sorry or congratulations message
# # Output how many shots it took the winner to sink the opponent’s ships
# # Output the total time that the game took to play
# end

end
