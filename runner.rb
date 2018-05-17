Dir["./lib/*.rb"].each { |file| require file}  #always have this above the start command
Battleship.new.start_sequence
