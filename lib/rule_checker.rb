require './lib/valid_coordinates'

class RuleChecker
  include ValidCoordinates

  def format_coordinates(user_input)
    user_input.strip.upcase.split
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

  def subtract_values(user_input)
    format_coordinates(user_input)[0][1].to_i -
    format_coordinates(user_input)[1][1].to_i
  end

  def placement_valid?(user_input)
    true if subtract_values(user_input).abs == 1 ||
    subtract_values(user_input).abs == 0
  end

  def two_unit_ship_valid?(user_input)
    true if coordinates_on_board?(user_input) && placement_valid?(user_input)
  end
end
