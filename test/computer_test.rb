require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_it_has_attributes
    computer = Computer.new
    assert_equal ['C1', 'D1'], computer.two_unit_ship
    assert_equal ['A1', 'A2', 'A3'], computer.three_unit_ship
    assert_equal [], computer.shots_fired
  end

  def test_it_has_valid_coordinates
    computer = Computer.new
    result = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal result, computer.valid_coordinates
  end

  def test_it_can_generate_a_shot
    computer = Computer.new
    valid_letters = ['A', 'B', 'C', 'D']
    valid_numbers = ['1', '2', '3', '4']
    assert_instance_of String, computer.aim
    assert_equal 2, computer.aim.length
    assert valid_letters.include?(computer.aim[0])
    assert valid_numbers.include?(computer.aim[1])
  end

  def test_it_can_check_if_coordinate_has_been_fired
    computer = Computer.new
    human = Human.new
    refute computer.duplicate_shot?('B1')
    computer.fire('B1', human)
    assert computer.duplicate_shot?('B1')
  end

  def test_when_it_fires_a_shot_it_is_stored_in_shots_fired
    computer = Computer.new
    human = Human.new
    computer.fire('B1', human)
    assert_equal 1, computer.shots_fired.length
  end

  def test_when_computer_hits_human_ship_coordinate_is_removed
    computer = Computer.new
    human = Human.new
    computer.fire('B1', human)
    assert_equal 1, human.two_unit_ship.length
  end

  def test_when_computer_can_sink_human_battleship
    computer = Computer.new
    human = Human.new
    computer.fire("B1", human)
    computer.fire("B2", human)
    assert_equal 0, human.two_unit_ship.length
  end
end
