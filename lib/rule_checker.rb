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

  def coordinates_on_board?(user_input)
    true if format_coordinates(user_input).length ==
    check_board(user_input).length
  end

  def subtract_number_values(user_input)
    number_values = []
    format_coordinates(user_input).each do |coordinate|
      number_values << coordinate[1].to_i
    end
    number_values.inject(:-)
  end

  def alphabetized?(user_input)
    letter_values = []
    format_coordinates(user_input).each do |coordinate|
      letter_values << coordinate[0]
    end
    true if letter_values == letter_values.sort
  end

  def coordinates_claimed?(user_input)
    true if two_unit_ship.inlcude?(user_input)
  end

  def two_ship_placement_valid?(user_input)
    true if subtract_number_values(user_input) == (-1) ||
    subtract_number_values(user_input) == 0
  end

  def three_ship_placement_valid?(user_input)
    true if subtract_number_values(user_input) == (-4) ||
    subtract_number_values(user_input) == (-5) || subtract_number_values(user_input) == 0
  end

  def two_unit_ship_valid?(user_input)
    true if coordinates_on_board?(user_input) && two_ship_placement_valid?(user_input) &&
    alphabetized?(user_input)
  end

  def three_unit_ship_valid?(user_input)
    true if coordinates_on_board?(user_input) &&
    coordinates_claimed? == false && three_ship_placement_valid?(user_input) && alphabetized?(user_input)
  end

end
