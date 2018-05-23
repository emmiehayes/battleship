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
    ui = gets.chomp
    if two_unit_ship_valid?(ui)
      store_coordinates(ui)
      place_three_unit_ship
    else
      puts Responder.two_unit_invalid_entry
      get_input
      place_two_unit_ship
    end
  end

  def place_three_unit_ship
    puts Responder.request_three_unit_ship
    ui = gets.chomp
    if three_unit_ship_valid?(ui)
      store_coordinates(ui)
      aim
    else
      puts Responder.three_unit_invalid_entry
      ui = gets.chomp
      place_three_unit_ship
    end
  end

  def store_coordinates(ui)
    if format_coords(ui).length == 2
      @two_unit_ship + format_coords(ui)
    elsif format_coords(ui).length == 3
      @three_unit_ship + format_coords(ui)
    end
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
