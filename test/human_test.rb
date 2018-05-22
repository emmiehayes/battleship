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

  def test_it_can_format_user_input
    human = Human.new
    assert_equal ['C2', 'C3'], human.format_coordinates('c2 c3')
  end

  def test_it_can_compare_user_input_to_valid_coordinates
    human = Human.new
    assert_equal ['C2', 'C3'], human.check_board('c2 c3')
    assert_equal ['B4'], human.check_board('b4 b5')
  end

  def test_valid_coordinates
    human = Human.new
    assert human.coordinates_on_board?('c2 c3')
    refute human.coordinates_on_board?('b4 b5')
  end

  def test_alphabetized_coordinates
    human = Human.new
    assert human.alphabetized?('c2 c3')
    refute human.alphabetized?('d1 a4')
  end

  def test_it_can_subtract_one_coordinate_from_the_other
    human = Human.new
    assert_equal 1, human.subtract_number_values('c3 c2')
    assert_equal 0, human.subtract_number_values('b1 a1')
    assert_equal 1, human.subtract_number_values('d2 d1')
    assert_equal 3, human.subtract_number_values('d4 d1')
    assert_equal (-3), human.subtract_number_values('d1 d4')
    assert_equal 0, human.subtract_number_values('c1 d1')
  end

  def test_it_can_check_for_valid_board_placement
    human = Human.new
    assert human.two_ship_placement_valid?('a1 b1')
    assert human.two_ship_placement_valid?('d1 d2')
    refute human.two_ship_placement_valid?('d4 d1')
    refute human.two_ship_placement_valid?('d1 d4')
  end

  def test_it_can_validate_two_unit_ship
    human = Human.new
    assert human.two_unit_ship_valid?('c2 c3')
    assert human.two_unit_ship_valid?('c1 d1')
    refute human.two_unit_ship_valid?('d4 d1')
    refute human.two_unit_ship_valid?('d1 d4')
    refute human.two_unit_ship_valid?('e1 e2')
    refute human.two_unit_ship_valid?('b1 a1')
    refute human.two_unit_ship_valid?('d2 d1')
  end

  def test_it_can_validate_three_unit_ship
    human = Human.new 
    assert human.two_unit_ship_valid?('c2 c3')
    assert human.two_unit_ship_valid?('c1 d1')
    refute human.two_unit_ship_valid?('d4 d1')
    refute human.two_unit_ship_valid?('d1 d4')
    refute human.two_unit_ship_valid?('e1 e2')
    refute human.two_unit_ship_valid?('b1 a1')
    refute human.two_unit_ship_valid?('d2 d1')
  end
end
