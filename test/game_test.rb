require './test/test_helper'
require './lib/game'
require './lib/responder'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_welcome_response_in_responder_module
    result = "Welcome to BATTLESHIP.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert Responder.welcome_response.include?(result)
  end

  def test_start_game_response_in_responder_module
    result = "I have laid out my ships on the grid."
    assert Responder.start_game_response.include?(result)
  end

  def test_instructional_response_in_responder_module
    result = "The objective of this game is"
    assert Responder.instructional_response.include?(result)
  end

  def test_end_game_response_in_responder_module
    result = 'Thank you for playing.'
    assert Responder.end_game_response.include?(result)
  end

end
