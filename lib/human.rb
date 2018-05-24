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
  end

  def request_two_unit_ship
    puts Responder.start_game_response
    ui = gets.chomp
    place_two_unit_ship(ui)
  end

  def place_two_unit_ship(ui)
    until two_unit_ship_valid?(ui)
      puts Responder.two_unit_invalid_entry
      ui = gets.chomp
    end
    @two_unit_ship << ui
    place_three_unit_ship
  end

  def place_three_unit_ship
    puts Responder.request_three_unit_ship
    ui = gets.chomp
    until three_unit_ship_valid?(ui)
      puts Responder.three_unit_invalid_entry
      ui = gets.chomp
    end
    @three_unit_ship + format_coords(ui)
    call_your_shot
  end

  def call_your_shot
    puts Responder.call_your_shot
    ui = gets.chomp.upcase.strip
    until valid_shot?(ui)
      puts Responder.invalid_or_duplicate_shot
      ui = gets.chomp
    end
    status(ui, computer = Computer.new)
  end

  def status(ui, computer)
    @shots_fired << ui
    if computer.two_unit_ship.include?(ui)
      computer.two_unit_ship.delete(ui)
      if computer.two_unit_ship.empty?
        puts Responder.human_destroys_computer_two
      else
        puts Responder.human_hit
      end
    elsif computer.three_unit_ship.include?(ui)
      computer.three_unit_ship.delete(ui)
      if computer.three_unit_ship.empty?
        puts Responder.human_destroys_computer_three
      else
        puts Responder.human_hit
      end
    else
      puts Responder.human_missed
    end
    computer.fire(aim)
  end




  def valid_shot?(ui)
    all_coords_on_board?(ui) && !duplicate_shot?(ui)
  end

  def duplicate_shot?(ui)
    true if @shots_fired.include?(ui)
  end

  def calculate_game_time
    (Time.now - @start_time).round
  end
end
