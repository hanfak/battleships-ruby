Controller
- Game(player, player = player.new(board,computer), ships* )
  - place ship
    - board#store(ship, x, y, direction)
  - fire
    - player#attack(x, y)
    - #win_state
  - show_player_board(player)
    - board#get_current_board(player)
    - printer#print_board
  - show_opponent_board(player)
    - board#get_current_board(player)
    - printer#print_board
  -

Models
  - ship(size, name/type)
  - board(x, y)
    -
    - #store
    - #get_current_board(player)
  - player(board, type=computer)
    - #attack
  - computer

View - printer class (print board as 2d board rather than array, give options for commands - place ship, attack)



No computer, just two player

Gameplay:

Start game
p1: set up ships on boards (place on board, viable position ( on board or not overlap other ship), see own board and update with ships on it )
p2: set up ships on boards (place on board, viable position ( on board or not overlap other ship), see own board and update with ships on it )
Repeat until one player has one
  p1: Show opponents board (only blank, hit or miss icons),fires shot at one square(options x and y), gets feedback (hit, sunk ship or miss), gets feedback on game status (won or not)
  p2: Show opponents board (only blank, hit or miss icons),fires shot at one square(options x and y), gets feedback (hit or miss), gets feedback on game status (won or not)
