require './test/test_helper'
require './lib/human'

class HumanTest < Minitest::Test

  def test_it_exists
    human = Human.new
    assert_instance_of Human, human
  end

  def test_it_has_attributes
    human = Human.new
    assert_equal [], human.two_unit_ship
    assert_equal [], human.three_unit_ship
    assert_equal [], human.shots_fired
    assert_equal [], human.hits
    assert_equal [], human.misses
    assert_instance_of Time, human.start_time
  end

end
