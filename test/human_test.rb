require './test/test_helper'
require './lib/human'
require './lib/responder'

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
  end

  def test_it_can_format_user_input
    human = Human.new
    assert_equal ['C2', 'C3'], human.format_coords('c2 c3')
  end

  def test_it_can_compare_user_input_to_valid_coordinates_array
    #helper method
    human = Human.new
    assert_equal ['C2', 'C3'], human.check_coords_exist('c2 c3')
    assert_equal ['B4'], human.check_coords_exist('b4 b5')
  end

  def test_coordinates_are_on_the_board?
    human = Human.new
    assert human.all_coords_on_board?('c2 c3')
    refute human.all_coords_on_board?('b4 b5')
  end

  def test_coordinates_can_be_subtracted
    #helper method
    human = Human.new
    assert_equal (-1), human.subtract('a1 a2')
    assert_equal (-1), human.subtract('d3 d4')
    assert_equal 0, human.subtract('C1 d1')
    assert_equal 0, human.subtract('b3 c3')
    assert_equal (-4), human.subtract('d1 d2 d3')
    assert_equal (-4), human.subtract('a4 b4 c4')
  end

  def test_coordinate_letters
    #helper method
    human = Human.new
    assert_equal ['D', 'D'], human.extract_letters('d2 d1')
    assert_equal ['C', 'B'], human.extract_letters('c2 b2')
    assert_equal ['A', 'D', 'C'], human.extract_letters('a1 d1 c1')
  end

  def test_coordinates_are_not_wrapped_around_the_board
    human = Human.new
    assert human.two_unit_no_wraps?('a1 b1')
    assert human.two_unit_no_wraps?('a1 a2')
    assert human.two_unit_no_wraps?('b2 b3')
    assert human.two_unit_no_wraps?('c3 c4')
    refute human.two_unit_no_wraps?('a4 a1')
    refute human.two_unit_no_wraps?('d3 a3')
    assert human.three_unit_no_wraps?('a1 b1 c1')
    assert human.three_unit_no_wraps?('a1 a2 a3')
    assert human.three_unit_no_wraps?('a2 a3 a4')
    refute human.three_unit_no_wraps?('b4 a1 a2')
  end

  def test_for_diagonals
    human = Human.new
    assert human.diagonal_coords?('a2 b3')
    assert human.diagonal_coords?('c3 d4')
    refute human.diagonal_coords?('a1 b1')
    refute human.diagonal_coords?('a2 a3')
    refute human.diagonal_coords?('a1 b1 c1')
    assert human.diagonal_coords?('a1 b2 c3')
    refute human.diagonal_coords?('a1 a2 a3')
    assert human.diagonal_coords?('b2 c3 d4')
  end

  def test_coords_can_be_mapped_for_comparison
    #helper method
    human = Human.new
      assert_equal [false, false], human.mapped_coords('a2 b3')
      assert_equal [false, false], human.mapped_coords('c3 d4')
      assert_equal [false, false], human.mapped_coords('a1 b1')
      assert_equal [false, false], human.mapped_coords('a2 a3')
      assert_equal [false, false, false], human.mapped_coords('a1 b1 c1')
      assert_equal [false, false, false], human.mapped_coords('a1 b2 c3')
      assert_equal [false, false, false], human.mapped_coords('a1 a2 a3')
      assert_equal [false, false, false], human.mapped_coords('b2 c3 d4')
  end

  def test_it_can_recognize_valid_two_unit_ship_coordinates
    human = Human.new
    assert human.two_unit_ship_valid?('c2 c3')
    assert human.two_unit_ship_valid?('c1 d1')
    refute human.two_unit_ship_valid?('d4 d1')
    refute human.two_unit_ship_valid?('d1 d4')
    refute human.two_unit_ship_valid?('e1 e2')
    refute human.two_unit_ship_valid?('a2 b3')
    refute human.two_unit_ship_valid?('d4 c3')
  end

  def test_it_can_recognize_valid_three_unit_ship_coordinates
    human = Human.new
    assert human.three_unit_ship_valid?('c2 c3 c4')
    assert human.three_unit_ship_valid?('a3 b3 c3')
    assert human.three_unit_ship_valid?('b1 c1 d1')
    refute human.three_unit_ship_valid?('d4 d1 d2')
    refute human.three_unit_ship_valid?('e1 e2 a1')
    refute human.three_unit_ship_valid?('b2 c3 d4')
  end

  def test_it_can_check_if_coordinate_has_been_fired
    human = Human.new
    computer = Computer.new
    refute human.duplicate_shot?('B1')
    human.fire('B1', computer)
    assert human.duplicate_shot?('B1')
  end

  def test_when_it_fires_a_shot_it_is_stored_in_shots_fired
    human = Human.new
    computer = Computer.new
    human.fire('B1', computer)
    assert_equal 1, human.shots_fired.length
  end

  def test_when_computer_can_sink_human_battleship
    human = Human.new
    computer = Computer.new
    human.fire("C1", computer)
    human.fire("D1", computer)
    assert_equal 0, computer.two_unit_ship.length
  end
end
