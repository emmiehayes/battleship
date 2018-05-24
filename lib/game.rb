require './lib/responder'

class Game
puts Responder.welcome_response

  def start_game_sequence
    user_input = gets.chomp.downcase.strip
    until user_input == 'q' || user_input == 'quit'
      if user_input == 'p' || user_input == "play"
      Human.new.request_two_unit_ship
      elsif user_input == 'i' || user_input == "instructions"
        puts Responder.instructional_response
      end
      user_input = gets.chomp.downcase.strip
    end
    puts Responder.end_game_response
  end
end
