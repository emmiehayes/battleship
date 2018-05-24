require './lib/valid_coordinates'
require './lib/responder'
require './lib/human'

class Computer
  include ValidCoordinates

  attr_accessor :two_unit_ship,
                :three_unit_ship

  attr_reader   :shots_fired

  def initialize
    @two_unit_ship    = ['C1', 'D1']
    @three_unit_ship  = ['A1', 'A2', 'A3']
    @shots_fired      = []
  end

  def aim
    valid_coordinates.shuffle.pop
  end

  def duplicate_shot?(aim)
    true if @shots_fired.include?(aim)
  end

  def fire(aim, human)
    @shots_fired << aim
    if human.two_unit_ship.include?(aim)
      human.two_unit_ship.delete(aim)
      if human.two_unit_ship.empty?
        puts Responder.computer_destroys_human_two
      else
        puts Responder.computer_hit
      end
    elsif human.three_unit_ship.include?(aim)
      human.three_unit_ship.delete(aim)
      if human.three_unit_ship.empty?
        puts Responder.computer_destroys_human_three
      else
        puts Responder.computer_hit
      end
    else
      puts Responder.computer_missed
    end
  end
end
