require './lib/valid_coordinates'
require './lib/diagonal_coordinates'

module RuleChecker
  include ValidCoordinates
  include DiagonalCoordinates

  def format_coords(ui)
    ui.upcase.split
  end

  def check_coords_exist(ui)
    format_coords(ui).select do |coord|
      valid_coordinates.include?(coord)
    end
  end

  def all_coords_on_board?(ui)
    true if format_coords(ui).length == check_coords_exist(ui).length
  end

  def subtract(ui)
    format_coords(ui).map do |coord|
      coord[1].to_i
    end.inject(:-)
  end

  def extract_letters(ui)
    format_coords(ui).map do |coord|
      coord[0]
    end
  end

  def letters_sorted?(ui)
    true if extract_letters(ui) == extract_letters(ui).sort
  end

  def two_unit_no_wraps?(ui)
    valid_differences = [-1, 0]
    true if valid_differences.include?(subtract(ui)) && letters_sorted?(ui)
  end

  def three_unit_no_wraps?(ui)
    valid_differences = [-5, -4, -3, -2, -1, 0]
    true if valid_differences.include?(subtract(ui)) && letters_sorted?(ui)
  end

  def diagonal_coords?(ui)
    true if diagonal_coordinates.include?(format_coords(ui))
  end

  def mapped_coords(ui)
    format_coords(ui).map do |coord|
      two_unit_ship.include?(coord)
    end
  end

  def coords_claimed?(ui)
    true if mapped_coords(ui).include?(true)
  end

  def two_unit_ship_valid?(ui)
    true if all_coords_on_board?(ui) && two_unit_no_wraps?(ui) && !diagonal_coords?(ui) && letters_sorted?(ui)
  end

  def three_unit_ship_valid?(ui)
    true if all_coords_on_board?(ui) && three_unit_no_wraps?(ui) &&
    !diagonal_coords?(ui) && !coords_claimed?(ui) && letters_sorted?(ui)
  end
end
