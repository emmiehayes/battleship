require './lib/valid_coordinates'
require './lib/rule_checker'
require './lib/computer'

class Human
  include ValidCoordinates
  include RuleChecker

  attr_accessor :two_unit_ship,
                :three_unit_ship

  attr_reader :shots_fired,
              :start_time

  def initialize
    @two_unit_ship   = ['B1', 'B2']
    @three_unit_ship = ['C2', 'C3', 'C4']
    @shots_fired     = []
    @start_time      = Time.new
  end

  puts Responder.start_game_response

  def place_two_unit_ship
    player_input = gets.chomp
    split_coordinates = format_coordinates(player_input)
    if two_unit_ship_valid?(spilt_coordinates)
      @two_unit_ship + split_coordinates
      puts Responder.ship_placed
    else
      puts Responder.invalid_entry
    end
  end

  def place_three_unit_ship
    player_input = gets.chomp
    split_coordinates = format_coordinates(player_input)
    if three_unit_ship_valid?(split_coordinates)
      @three_unit_ship + split_coordinates
      puts Responder.all_ships_down
    else
      puts Responder.invalid_entry
    end
  end

  def aim
    player_aim = gets.chomp.upcase.strip
  end

  def duplicate_shot?(aim)
    true if @shots_fired.include?(aim)
  end

  def fire(aim, computer)
    @shots_fired << aim
    if computer.two_unit_ship.include?(aim)
      computer.two_unit_ship.delete(aim)
      if computer.two_unit_ship.empty?
        puts Responder.battleship_two_destroyed
      else
        puts Responder.hit
      end
    elsif computer.three_unit_ship.include?(aim)
      computer.three_unit_ship.delete(aim)
      if computer.three_unit_ship.empty?
        puts Responder.battleship_three_destroyed
      else
        puts Responder.hit
      end
    else
      puts Responder.missed
    end
  end
end


def calculate_game_time
  (Time.now - @start_time).round
end
end
