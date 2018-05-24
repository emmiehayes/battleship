require './lib/valid_coordinates'
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

  def generate_shot
    valid_coordinates.shuffle.pop
  end

  def duplicate_shot?(generate_shot)
    true if @shots_fired.include?(generate_shot)
  end

  def fire(generate_shot, human = Human.new)
    @shots_fired << generate_shot
    if human.two_unit_ship.include?(generate_shot)
      human.two_unit_ship.delete(generate_shot)
      puts Responder.computer_hit
    elsif human.two_unit_ship.empty?
      puts Responder.computer_destroys_human_two
    elsif human.three_unit_ship.include?(generate_shot)
      human.three_unit_ship.delete(generate_shot)
      puts Responder.computer_hit
    elsif human.three_unit_ship.empty?
      puts Responder.computer_destroys_human_three
    else
      puts Responder.computer_missed
    end
  end
end
