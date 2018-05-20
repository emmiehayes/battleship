require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_it_has_attributes
    player = Player.new
    assert_equal [], player.two_unit_ship
    assert_equal [], player.three_unit_ship
    assert_equal [], player.shots_fired
    assert_equal [], player.hits
    assert_equal [], player.misses
    assert_instance_of Time, player.start_time
  end

end
