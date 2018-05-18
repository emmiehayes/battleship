class Play

  def computer_place_your_ships
    # when the player decides to play the game (battleship class) it will create a new instance of play.
    # generate random placements based on rules- consider breaking rules logic out into its own method if need be
    # the computer will immediately place it's ships and print the following message to the screen:
  end

  puts 'You now need to layout your two ships. The first is two units long and the second is three units long. The grid has A1 at the top left and D4 at the bottom right. Enter the squares for the two-unit ship:'

  def player_place_your_ships
    user_input = gets.chomp.strip
    #(user input will look like this...  A1 A2)
    # create new instance of board, mark two-unit ship based on user_input
    # follow with the following prompt:
    puts 'Enter the squares for the three-unit ship:'
    #mark three-unit ship based on user input
  end

  def validate_player_ship_positions
    # based on rules method (method call within this class)
    # If a user enters an invalid ship coordinate, the game should display a message explaining which of the rules their choice violated # Ask them to re-enter all coordinates for the invalid ship placed.
    # *** Any previous ship placements should still be retained ***
    # Ships cannot wrap around the board
    # Ships cannot overlap
    # Ships cannot be laid diagonal- just vertical or horizontal
    # Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
    # if all ships are valid, call new instance of game.
  end
end
