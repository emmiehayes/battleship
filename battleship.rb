Dir["./lib/*.rb"].each { |file| require file}
Game.new.start_game_sequence
