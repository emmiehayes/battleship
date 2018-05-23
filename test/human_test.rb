require './test/test_helper'
require './lib/human'

class HumanTest < Minitest::Test

  def test_it_exists
    human = Human.new
    assert_instance_of Human, human
  end

  def test_it_has_attributes
    human = Human.new
    computer = Computer.new
    assert_equal [], human.two_unit_ship
    assert_equal [], human.three_unit_ship
    assert_equal [], human.shots_fired
    assert_instance_of Time, human.start_time
    assert_instance_of Computer, human.opponent
  end

  def test_it_can_format_user_input
    human = Human.new
    assert_equal ['C2', 'C3'], human.format_coordinates('c2 c3')

  end

  def test_it_can_compare_user_input_to_valid_coordinates_array
    #helper method
    human = Human.new
    assert_equal ['C2', 'C3'], human.check_coordinates_exist('c2 c3')
    assert_equal ['B4'], human.check_coordinates_exist('b4 b5')
  end

  def test_coordinates_are_on_the_board?
    human = Human.new
    assert human.all_coordinates_on_board?('c2 c3')
    refute human.all_coordinates_on_board?('b4 b5')
  end

  def test_coordinates_can_be_subtracted
    #helper method
    human = Human.new
    assert_equal -1, human.subtract_values('A1 A2')
    assert_equal -1, human.subtract_values('d3 d4')
    assert_equal 0, human.subtract_values('C1 d1')
    assert_equal 0, human.subtract_values('b3 c3')
    assert_equal -4, human.subtract_values('d1 d2 d3')
    assert_equal -4, human.subtract_values('a4 b4 c4')
  end

  def test_coordinates_are_not_wrapped_around_the_board
    human = Human.new
    assert human.two_unit_no_wrapping?('a1 b1')
    assert human.two_unit_no_wrapping?('a1 a2')
    assert human.two_unit_no_wrapping?('b2 b3')
    assert human.two_unit_no_wrapping?('c3 c4')
    refute human.two_unit_no_wrapping?('a4 a1')
    refute human.two_unit_no_wrapping?('d3 a3')
    #
    # assert human.three_unit_no_wrapping?('a1 b1 c1')
    # assert human.three_unit_no_wrapping?('a1 a2 a3')
    # assert human.three_unit_no_wrapping?('a2 a3 a4')
    # refute human.three_unit_no_wrapping?('b4 a1 a2')
  end

  def test_for_diagonals
    skip
    human = Human.new
    assert human.two_ship_diagonal_coordinates? ('a2 b3')
    assert human.two_ship_diagonal_coordinates? ('c3 d4')
    refute human.two_ship_diagonal_coordinates? ('a1 b1')
    refute human.two_ship_diagonal_coordinates? ('a2 a3')
    refute human.two_ship_diagonal_coordinates? ('a1 c3')
  end

  def test_it_can_validate_two_unit_ship
    skip
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
    skip
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
