require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    g = Game.new
    assert_instance_of Game, g
  end

end
