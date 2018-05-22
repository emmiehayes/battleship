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

  def test_given_coordinates_are_actual_coordinates
    human = Human.new
    assert human.all_coordinates_on_board?('c2 c3')
    refute human.all_coordinates_on_board?('b4 b5')
  end

  def test_given_coordinates_are_not_wrapped
    human = Human.new
    assert human.two_unit_wrap_free?('a1 b1')
    assert human.two_unit_wrap_free?('a1 a2')
    assert human.two_unit_wrap_free?('b2 b3')
    assert human.two_unit_wrap_free?('c3 c4')
    assert human.three_unit_wrap_free?('a1 b1 c1')
    assert human.three_unit_wrap_free?('a1 a2 a3')
    assert human.three_unit_wrap_free?('a2 a3 a4')
    refute human.two_unit_wrap_free?('d4 a1')
    refute human.three_unit_wrap_free?('b4 a1 a2')
  end

  def test_for_diagonals
    human = Human.new
    assert human.two_ship_diagonal_coordinates? ('a2 b3')
    assert human.two_ship_diagonal_coordinates? ('c3 d4')
    refute human.two_ship_diagonal_coordinates? ('a1 b1')
    refute human.two_ship_diagonal_coordinates? ('a2 a3')
    refute human.two_ship_diagonal_coordinates? ('a1 c3')
  end

  def test_it_can_validate_two_unit_ship
    human = Human.new
    assert human.two_unit_ship_valid?('c2 c3')
    assert human.two_unit_ship_valid?('c1 d1')
    assert human.two_unit_ship_valid?('b1 a1')
    refute human.two_unit_ship_valid?('d4 d1')
    refute human.two_unit_ship_valid?('d1 d4')
    refute human.two_unit_ship_valid?('e1 e2')
    refute human.two_unit_ship_valid?('d2 d1')
    refute human.two_unit_ship_valid?('a1 d1')
    refute human.two_unit_ship_valid?('a2 d4')
  end

  def test_it_can_validate_three_unit_ship
    human = Human.new
    assert human.three_unit_ship_valid?('c2 c3 c4')
    assert human.three_unit_ship_valid?('a3 b3 c3')
    refute human.three_unit_ship_valid?('d4 d1 d2')
    refute human.three_unit_ship_valid?('e1 e2 a1')
    refute human.three_unit_ship_valid?('b1 a1 d1')
    refute human.three_unit_ship_valid?('b1 c1 d1')
    refute human.three_unit_ship_valid?('b2 c3 d4')
    refute human.three_unit_ship_valid?('b3 c2 d1')
  end
end
