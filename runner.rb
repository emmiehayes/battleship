Dir["./lib/*.rb"].each { |file| require file}
Battleship.new.start_game_sequence
