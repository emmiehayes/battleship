require './lib/valid_coordinates'
require 'pry'

module RuleChecker
  include ValidCoordinates

  def format_coordinates(user_input)
    user_input.upcase.split
  end

  def check_board(user_input)
    format_coordinates(user_input).select do |coordinate|
      valid_coordinates.include?(coordinate)
    end
  end

  def all_coordinates_on_board?(user_input)
    true if format_coordinates(user_input).length ==
    check_board(user_input).length
  end

  def subtract_values(user_input)
    number_values = []
    format_coordinates(user_input).each do |coordinate|
      number_values << coordinate[1].to_i
    end
    number_values.inject(:-)
  end

  def two_unit_wrap_free?(user_input)
    true if subtract_values(user_input) == (-1) ||
    subtract_values(user_input) == (0)
  end

  def three_unit_wrap_free?(user_input)
    true if subtract_values(user_input) <= -1
  end

  def two_ship_diagonal_coordinates?(user_input)
    sorted = format_coordinates(user_input).sort
    true if sorted[0][0].next != sorted[1][0] && sorted[0][1] == sorted[1][1] ||
    sorted[0][0] != sorted[1][0] && sorted[0][1].to_i + 1 == sorted[1][1].to_i
  end

  def coordinates_claimed?(user_input)
    formatted = format_coordinates(user_input)
    true if two_unit_ship.include?(formatted[0]) ||
            two_unit_ship.include?(formatted[1]) ||
            two_unit_ship.include?(formatted[2])
  end

  def two_unit_ship_valid?(user_input)
    true if all_coordinates_on_board?(user_input) &&
            two_unit_wrap_free?(user_input) &&
            !two_ship_diagonal_coordinates?(user_input)
  end

  def three_unit_ship_valid?(user_input)
    true if all_coordinates_on_board?(user_input) &&
    three_unit_wrap_free?(user_input) &&
    !coordinates_claimed?(user_input)
  end
end
