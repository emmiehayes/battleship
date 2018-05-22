require './lib/valid_coordinates'
require './lib/responder'

class Player
  include ValidCoordinates
  attr_reader :two_unit_ship,
              :three_unit_ship,
              :shots_fired,
              :start_time

  def initialize
    @two_unit_ship   = []
    @three_unit_ship = []
    @shots_fired     = []
    @start_time      = Time.new
  end

  def calculate_game_time
    (Time.now - @start_time).round
  end
end
