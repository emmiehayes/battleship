require './test/test_helper'
require './lib/rule_checker'

class RuleCheckerTest < Minitest::Test

  def test_it_exists
    rc = RuleChecker.new
    assert_instance_of RuleChecker, rc
  end

  def test_it_can_format_user_input
    rc = RuleChecker.new
    assert_equal ['C2', 'C3'], rc.format_coordinates('c2 c3')
  end

  def test_it_can_compare_user_input_to_valid_coordinates
    rc = RuleChecker.new
    assert_equal ['C2', 'C3'], rc.check_board('c2 c3')
    assert_equal ['B4'], rc.check_board('b4 b5')
  end

  def test_valid_coordinates
    rc = RuleChecker.new
    assert rc.coordinates_on_board?('c2 c3')
    refute rc.coordinates_on_board?('b4 b5')
  end

  def test_it_can_subtract_one_coordinate_from_the_other
    rc = RuleChecker.new
    assert_equal 1, rc.subtract_values('c3 c2')
    assert_equal 0, rc.subtract_values('b1 a1')
    assert_equal 1, rc.subtract_values('d2 d1')
    assert_equal 3, rc.subtract_values('d4 d1')
    assert_equal (-3), rc.subtract_values('d1 d4')
    assert_equal 0, rc.subtract_values('c1 d1')
  end

  def test_it_can_check_for_valid_board_placement
    rc = RuleChecker.new
    assert rc.placement_valid?('c3 c2')
    assert rc.placement_valid?('b1 a1')
    assert rc.placement_valid?('d2 d1')
    refute rc.placement_valid?('d4 d1')
    refute rc.placement_valid?('d1 d4')
    assert rc.placement_valid?('c1 d1')
  end

  def test_it_can_validate_two_unit_ship
    rc = RuleChecker.new
    assert rc.two_unit_ship_valid?('c3 c2')
    assert rc.two_unit_ship_valid?('b1 a1')
    assert rc.two_unit_ship_valid?('d2 d1')
    assert rc.two_unit_ship_valid?('c1 d1')
    refute rc.two_unit_ship_valid?('d4 d1')
    refute rc.two_unit_ship_valid?('d1 d4')
    refute rc.two_unit_ship_valid?('e1 e2')
  end
end
