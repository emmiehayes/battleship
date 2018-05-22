require './test/test_helper'
require './lib/human'

class HumanTest < Minitest::Test

  def test_it_exists
    human = Human.new
    assert_instance_of Human, human
  end

  def test_it_has_attributes
    human = Human.new
    assert_equal ['B1', 'B2'], human.two_unit_ship
    assert_equal ['C2', 'C3', 'C4'], human.three_unit_ship
    assert_equal [], human.shots_fired
    assert_instance_of Time, human.start_time
  end

  def test_it_can_place_two_unit_ship
    
  end


end
