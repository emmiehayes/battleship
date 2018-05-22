require './lib/player'
require './lib/human'
require 'pry'

class Computer #will inherit from player once game works
  include ValidCoordinates

  attr_accessor :two_unit_ship,
                :three_unit_ship
  attr_reader :shots_fired,
              :start_time

  def initialize
    @two_unit_ship   = ['C1', 'D1']
    @three_unit_ship = ['A1', 'A2', 'A3']
    @shots_fired     = []
    @start_time      = Time.new
  end

  def aim
    "B1"  #valid_coordinates.shuffle.pop
  end

  def duplicate_shot?(aim)
    true if @shots_fired.include?(aim)
  end

  def fire(aim, human)
    @shots_fired << aim
    if human.two_unit_ship.include?(aim)
      human.two_unit_ship.delete(aim)
      puts "Hit"
    elsif human.three_unit_ship.include?(aim)
      human.three_unit_ship.delete(aim)
      puts "Hit"
    else
      puts "Miss"
    end
  end


  def calculate_game_time
    (Time.now - @start_time).round
  end
end



# HARD CODING SHIP COORDINATES TO GET THE GAME WORKING-
# WILL REVIST SHIP COORDINATE GENERATOR ONCE GAME IS WORKING 85% COMPLETE

  # def place_two_unit_ship
  #   @two_unit_ship << two_unit_first
  #   @two_unit_ship << two_unit_second
  # end
  #
  # def place_three_unit_ship
  #   @three_unit_ship << three_unit_first
  #   @three_unit_ship << three_unit_second
  #   @three_unit_ship << three_unit_third
  # end
  #
  # def two_unit_first
  #   valid_coordinates.shuffle.pop
  # end
  #
  # def two_unit_second
  #   coordinate_pairs = {'A1'=>['A2', 'B1'],
  #                       'A2'=>['A1', 'A3', 'B2'],
  #                       'A3'=>['A2', 'A4', 'B3'],
  #                       'A4'=>['A3', 'B4'],
  #                       'B1'=>['A1', 'B2', 'C1'],
  #                       'B2'=>['A2', 'B1', 'B3', 'C2'],
  #                       'B3'=>['A3', 'B2', 'B4', 'C3'],
  #                       'B4'=>['A4', 'B3', 'C4'],
  #                       'C1'=>['B1', 'C2', 'D1'],
  #                       'C2'=>['B2', 'C1', 'C3', 'D2'],
  #                       'C3'=>['B3', 'C2', 'C4', 'D3'],
  #                       'C4'=>['B4', 'C3', 'D4'],
  #                       'D1'=>['C1', 'D2'],
  #                       'D2'=>['C2', 'D1', 'D3'],
  #                       'D3'=>['C3', 'D2', 'D4'],
  #                       'D4'=>['C4', 'D3']
  #                       }
  #   valid_options = coordinate_pairs[two_unit_first]
  #   valid_options.shuffle.pop
  # end
  #
  # def three_unit_first
  #   coordinates = valid_coordinates.delete(two_unit_ship[0], two_unit_ship[1])
  #   coordinates.shuffle.pop
  # end
  #
  # def three_unit_second
  #   coordinate_pairs = {'A1'=>['A2', 'B1'],
  #                       'A2'=>['A1', 'A3', 'B2'],
  #                       'A3'=>['A2', 'A4', 'B3'],
  #                       'A4'=>['A3', 'B4'],
  #                       'B1'=>['A1', 'B2', 'C1'],
  #                       'B2'=>['A2', 'B1', 'B3', 'C2'],
  #                       'B3'=>['A3', 'B2', 'B4', 'C3'],
  #                       'B4'=>['A4', 'B3', 'C4'],
  #                       'C1'=>['B1', 'C2', 'D1'],
  #                       'C2'=>['B2', 'C1', 'C3', 'D2'],
  #                       'C3'=>['B3', 'C2', 'C4', 'D3'],
  #                       'C4'=>['B4', 'C3', 'D4'],
  #                       'D1'=>['C1', 'D2'],
  #                       'D2'=>['C2', 'D1', 'D3'],
  #                       'D3'=>['C3', 'D2', 'D4'],
  #                       'D4'=>['C4', 'D3']
  #                       }
  #     # still trying to figure out some logic here
  # end
  #
  # def three_unit_third
  #   coordinate_pairs = {['A1', 'A2']=>['A3'],
  #                       ['A2', 'A3']=>['A4'],
  #                       ['A3', 'A4']=>['A2'],
  #                       ['B1', 'B2']=>['B3'],
  #                       ['B2', 'B3']=>['B4'],
  #                       ['B3', 'B4']=>['B2'],
  #                       ['C1', 'C2']=>['C3'],
  #                       ['C2', 'C3']=>['C4'],
  #                       ['C3', 'C4']=>['C2'],
  #                       ['D1', 'D2']=>['D3'],
  #                       ['D2', 'D3']=>['D4'],
  #                       ['D3', 'D4']=>['D2'],
  #                       ['A1', 'B1']=>['C1'],
  #                       ['B1', 'C1']=>['D1'],
  #                       ['C1', 'D1']=>['B1'],
  #                       ['A2', 'B2']=>['C2'],
  #                       ['B2', 'C2']=>['D2'],
  #                       ['C2', 'D2']=>['B2'],
  #                       ['A3', 'B3']=>['C3'],
  #                       ['B3', 'C3']=>['D3'],
  #                       ['C3', 'D3']=>['B3'],
  #                       ['A4', 'B4']=>['C4'],
  #                       ['B4', 'C4']=>['D4'],
  #                       ['C4', 'D4']=>['B4']
  #                       }
  #       #see line 67
  # end
