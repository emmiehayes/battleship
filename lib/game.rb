class Game
  # during the main game, players take turns firing at one another by selecting positions on the grid to attack.

def player_shot_sequence
  # Once the ships are laid out the game starts with the Player Shot Sequence.
  # Display the map from the current player’s point of view
  # Prompt the player for a position on which to fire
  # Indicate whether that shot was a hit or a miss and display an updated map
end

def render_game_grid
  # During the player_shot_sequence the game will frequently need to display the current game view.
  # We’ll use a simple ASCII text grid of letters (to indicate rows) and numbers (to indicate columns).
  # Your board will look something like this
  # header = ===========
  # rows =   [. 1 2 3 4]
  # col =   [A, B, C, D]
  # header = ===========
end
end
