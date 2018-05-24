module Responder

  def self.welcome_response
    clear_screen
    "Welcome to BATTLESHIP.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.start_game_response
    clear_screen
    "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the second is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
  end

  def self.request_three_unit_ship
    clear_screen
    "Enter three new squares for the three-unit ship:"
  end

  def self.all_ships_down
    clear_screen
    "Our Battleships have all been placed."
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
    "Invalid coordinates were entered.  \nREMEMBER: \nCoordinates must fall between A1 and D4. \nCoordinates should be separated by a single space. \nCoordinates should be alphabetical order \n\nEnter the squares for the two-unit ship:"
  end

  def self.three_unit_invalid_entry
    clear_screen
    "Invalid coordinates were entered.  \nMake sure your coordinates fall between A1 and D4. \nMake sure no commas are entered with your coordinates and your three unit ship is not overlapping with your two unit ship.  \n\nEnter the squares for the three unit ship:"
  end

  def self.call_your_shot
    clear_screen
      "  ==============================
      \n  .   1      2      3      4
      \n  A ['A1'] ['A2'] ['A3'] ['A4']
      \n  B ['B1'] ['B2'] ['B3'] ['B4']
      \n  C ['C1'] ['C2'] ['C3'] ['C4']
      \n  D ['D1'] ['D2'] ['D3'] ['D4']
      \n  ============================= \n\nAll ships have been placed.  It's time for you to try and track down my ships! Call your shot to release fire:"
  end

  def self.sorry_response
    clear_screen
    "It appears I destroyed both of your battleships in  #{calculate_game_time / 60} minute(s), #{calculate_game_time % 60} second(s).  #{@computer_shots_taken.length} total shots were fired to take down you down.  Would you like to (p)lay again or (q)uit?"
  end

  def self.congratulations
    clear_screen
    "Congratulations! You destroyed both of my battleships in  #{calculate_game_time / 60} minute(s), #{calculate_game_time % 60} second(s). In #{@player_shots_taken.length} shots you were able to take down both of of my ships.  Would you like to (p)lay again or (q)uit?"
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

  def self.computer_destroys_human_two
    "**I sunk your ship!\nYour two_unit ship has been destroyed!**"
  end

  def self.computer_destroys_human_three
    "**I sunk your ship!\nYour three_unit ship has been destroyed!**"
  end

  def self.computer_hit
    "I hit one of your ships!  You're turn:"
  end

  def self.computer_missed
    "Damn, I missed.  You're up:"
  end

  def self.human_destroys_computer_two
    "**You sunk my battleship!\n My three_unit ship has been destroyed."
  end

  def self.human_destroys_computer_three
    "**You sunk my battleship!\n My two_unit ship has been destroyed."
  end
  def self.human_hit
    "Target Hit!"
  end

  def self.human_missed
    "Target Missed!"
  end

  def self.invalid_or_duplicate_shot
    clear_screen
    "The shot you are trying to take is not available.\nCall your shot to release fire:"
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.duplicate_shot
    clear_screen
    "You already took that shot.  Enter a coordinate to release fire on your enemy:"
  end

end
