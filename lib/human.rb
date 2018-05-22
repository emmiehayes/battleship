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
    @two_unit_ship   = []
    @three_unit_ship = []
    @shots_fired     = []
    @start_time      = Time.new
  end

  def place_two_unit_ship
    puts Responder.start_game_response
    human_input = gets.chomp
    while two_unit_ship_valid?(human_input)
      @two_unit_ship + format_coordinates(human_input)
      place_three_unit_ship
    end
    puts Responder.two_unit_invalid_entry
    human_input = gets.chomp
    place_two_unit_ship
  end

  def place_three_unit_ship
    puts Responder.request_three_unit_ship
    human_input = gets.chomp
    while three_unit_ship_valid?(human_input)
      @three_unit_ship + format_coordinates(human_input)
      aim
    end
    puts Responder.three_unit_invalid_entry
    human_input = gets.chomp
    place_three_unit_ship
  end

  def aim
    puts Responder.aim_battleship
    player_aim = gets.chomp.upcase.strip
    if duplicate_shot?(player_aim)
      puts Responder.duplicate_shot
    else
      fire(aim, computer)
    end
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

  def calculate_game_time
    (Time.now - @start_time).round
  end
end
