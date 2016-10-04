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

6 A | 0 0 0 0 0 0
5 B | 0 0 0 0 0 0
4 C | 0 0 0 0 0 0
3 D | 0 0 0 0 0 0
2 E | 0 0 0 0 0 0
1 F | 0 0 0 0 0 0
      - - - - - -
      1 2 3 4 5 6

Choose hit
  x:
  y:

No computer, just two player

Gameplay:

Start game
p1: set up ships on boards (place on board, viable position ( on board or not overlap other ship), see own board and update with ships on it )
p2: set up ships on boards (place on board, viable position ( on board or not overlap other ship), see own board and update with ships on it )
Repeat until one player has one
  p1: Show opponents board (only blank, hit or miss icons),fires shot at one square(options x and y), gets feedback (hit, sunk ship or miss), gets feedback on game status (won or not)
  p2: Show opponents board (only blank, hit or miss icons),fires shot at one square(options x and y), gets feedback (hit or miss), gets feedback on game status (won or not)

player has a board(init new board at init) and several ships, it can place ships on the board(asks the board to do add counter) and fire on them(ask the board to change counter), it can see board (ask board(player))


non ship ob board should be object :sea or :miss

User story 6

<!-- #opp_player.show_hidden_board calleed when player.opponents_board(opp_player) is run
  - Give empty board of 0
  - Show array with :hit, :miss, 0
  - Shows the oppponent board to the player -->

#player.attack(player_opp, x , y)
  - calls player_opp.change_board_status(x-1,y-1)
    - Check if location has ship
      -> change ship status to :hit and return :hit
      -> else change board SeaObjet status to :miss and return :miss
      or return call to status for those objects

Change 0 to SeaObjects, that if status = :miss
  - default @status = 0

ship.status
  - check location array of ship, find coord and if matches, change :hit to true
  - When placing ship, store location will have status arg default = nil
  - When hit, status change to :hit,
  - has coords of where hit
