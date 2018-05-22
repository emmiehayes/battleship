require './lib/valid_coordinates'
require './lib/responder'

class Human < Player
  include ValidCoordinates
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

  def calculate_game_time
    (Time.now - @start_time).round
  end
end
