module Responder

  def self.welcome_response
    clear_screen
    "Welcome to BATTLESHIP.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.start_game_response
    clear_screen
    "I have laid out my ships on the grid. You now need to layout your first ship. \nREMEMBER: \nShips cannot wrap around the board. \nShips cannot overlap. \nShips can only be laid either horizontally or vertically.  \nCoordinates must correspond to the first and last units of the ship. \n(IE: A two unit ship cannot be placed at: A1 A3 but can be placed at A1 A2).
    \n\nEnter the two coordinates where you would like to place your first ship:"
  end

  def self.request_three_unit_ship
    clear_screen
    "Enter the three coordinates where you would like to place your ship:"
  end

  def self.all_ships_down
    clear_screen
    "Your Battleships have been placed."
  end

  def self.instructional_response
    clear_screen
    "The objective of this game is to try and sink the computer\'s two ships before it sinks yours.  Neither you nor the computer can see the other\'s board so you must try to guess where the ships are located .\nWould you like to (p)lay or (q)uit?"
  end

  def self.end_game_response
    clear_screen
    'Thank you for playing.'
  end

  def self.two_unit_invalid_entry
    clear_screen
    "Invalid coordinates were entered.  \nMake sure your coordinates fall between A1 and D4. \nMake sure no commas are entered with your coordinates.\n\nEnter the two coordinates where you would like to place your first ship:"
  end

  def self.three_unit_invalid_entry
    clear_screen
    "Invalid coordinates were entered.  \nMake sure your coordinates fall between A1 and D4. \nMake sure no commas are entered with your coordinates and your three unit ship is not overlapping with your two unit ship.  \n\nEnter the three coordinates where you would like to place your second ship:"
  end

  def self.aim_battleship
    clear_screen
      "  ==============================
      \n  .   1      2      3      4
      \n  A ['A1'] ['A2'] ['A3'] ['A4']
      \n  B ['B1'] ['B2'] ['B3'] ['B4']
      \n  C ['C1'] ['C2'] ['C3'] ['C4']
      \n  D ['D1'] ['D2'] ['D3'] ['D4']
      \n  ============================= \nLet the game begin! Enter a coordinate to release fire on your enemy:"
  end

  def self.sorry_response
    clear_screen
    "It appears your opponent destroyed both of your battleships in  #{calculate_game_time / 60} minute(s), #{calculate_game_time % 60} second(s).  #{@computer_shots_taken.length} total shots were fired to take down your battleships.  Would you like to (p)lay again or (q)uit?"
  end

  def self.congratulations
    clear_screen
    "Congratulations! You destroyed both of your opponent's battleships in  #{calculate_game_time / 60} minute(s), #{calculate_game_time % 60} second(s). In #{@player_shots_taken.length} shots you were able to take down both of your oppenents battleships.  Would you like to (p)lay again or (q)uit?"
  end

  def clean_board
    clear_screen
    """
    \n  =============================
    \n  .   1      2      3      4
    \n  A ['A1'] ['A2'] ['A3'] ['A4']
    \n  B ['B1'] ['B2'] ['B3'] ['B4']
    \n  C ['C1'] ['C2'] ['C3'] ['C4']
    \n  D ['D1'] ['D2'] ['D3'] ['D4']
    \n  =============================
    """
  end

  def self.battleship_two_destroyed
    "**Two Unit Ship Destroyed!**"
  end

  def self.battleship_three_destroyed
    "**Three Unit Ship Destroyed!**"
  end

  def self.hit
    "Hit!"
  end

  def self.missed
    "Missed!"
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.duplicate_shot
    clear_screen
    "You already took that shot.  Enter a coordinate to release fire on your enemy:"
  end

end
