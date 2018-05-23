require './lib/valid_coordinates'
require './lib/rule_checker'
require './lib/computer'

class Human
  include ValidCoordinates
  include RuleChecker

  attr_accessor :two_unit_ship,
                :three_unit_ship

  attr_reader :shots_fired,
              :start_time,
              :opponent

  def initialize
    @two_unit_ship   = []
    @three_unit_ship = []
    @shots_fired     = []
    @start_time      = Time.new
    @opponent        = Computer.new
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
      fire(player_aim)
    end
  end

  def fire(player_aim)
    @shots_fired << player_aim
    status?(player_aim)
  end

  def status?(player_aim)
    if @opponent.two_unit_ship.include?(player_aim)
      puts Responder.hit
      @opponent.two_unit_ship.delete(player_aim)
    else
      puts Responder.missed
    end
  end

  def duplicate_shot?(aim)
    true if @shots_fired.include?(aim)
  end

  def calculate_game_time
    (Time.now - @start_time).round
  end
end
