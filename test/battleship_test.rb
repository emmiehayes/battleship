require 'test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test

  def test_it_exists
    b = Battleship.new
    assert_instance_of Battleship, b
  end

end
