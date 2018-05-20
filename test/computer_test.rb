require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_it_has_attributes
    computer = Computer.new
    assert_equal [], computer.two_unit_ship
    assert_equal [], computer.three_unit_ship
    assert_equal [], computer.shots_fired
    assert_equal [], computer.hits
    assert_equal [], computer.misses
    assert_instance_of Time, computer.start_time
  end

  def test_it_has_valid_coordinates
    computer = Computer.new
    result = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal result, computer.valid_coordinates
  end

  def test_it_can_generate_two_unit_first_coordinate
    computer = Computer.new
    valid_letters = ['A', 'B', 'C', 'D']
    valid_numbers = ['1', '2', '3', '4']
    assert_instance_of String, computer.two_unit_first
    assert_equal 2, computer.two_unit_first.length
    assert valid_letters.include?(computer.two_unit_first[0])
    assert valid_numbers.include?(computer.two_unit_first[1])
  end

  



end
