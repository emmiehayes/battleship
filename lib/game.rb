require './lib/responder'

class Game
puts Responder.welcome_response

  def start_game_sequence
    user_input = gets.chomp.downcase.strip
    until user_input == 'q' || user_input == 'quit'
      if user_input == 'p' || user_input == "play"
        Human.new.place_two_unit_ship
        # Computer.new.generate_ship_coordinates***
      elsif user_input == 'i' || user_input == "instructions"
        puts Responder.instructional_response
      end
      user_input = gets.chomp.downcase.strip
    end
    puts Responder.end_game_response
  end

  def end_game_sequence
  # When either the player or computer destroy their opponents ships, output the Responder.sorry_response or Responder.congratulations_response depending on the player final status and ask if they want to play again or quit.
  end

end

#*** if i get to the point where my computer ships are not hardcoded i will instantiate the Computer class like the spec request.  while i have the computer ships hard coded i will instantiate the Human class.
