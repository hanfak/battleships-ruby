# BATTLE SHIPS GAME

## Info

Game of battleships, built using ruby and tested with rspec. This game is run via the command line.

## To run specs

```
$ bundle
```

```
$ rspec
```

## To play


```
$ pry
```

*create players*

```ruby
player1 = Player.new(Board.new)
player2 = Player.new(Board.new)
```

*create ships*

```ruby
player1_ship1 = Ship.new(1)
player1_ship1 = Ship.new(1)

player2_ship2 = Ship.new(2)
player2_ship2 = Ship.new(2)

player3_ship3 = Ship.new(3)
player3_ship3 = Ship.new(3)
```

*place ship (make sure other player is not looking)*

Horizontally

```ruby
player1.add(player1_ship1, 4, 3)
player2.add(player2_ship1, 4, 3)
```

Vertically

```ruby
player1.add(player1_ship1, 4, 3, :vertical)
```

*Take turns attacking*

Player 2 attacks player 1

```ruby
player2.attack(player1, 1, 1)
```

or Player 1 attacks player 2

```
player1.attack(player2, 3, 5)
```

*View the opponents board*

Player 2 views player 1 board

```ruby
player2.view_opponent_board(player1)
```

or Player 1 views player 2 board

```ruby
player1.view_opponent_board(player2)
```

The first to knock out all opponent's ship wins

Good luck

## To come

A game runner, to avoid typing all this out

User Stories

```
As a player
So that I can prepare for the game
I would like to place a ship in a board location


As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from


As a player
So that I can create a layout of ships to outwit my opponent
I would like to be able to choose the directions my ships face in


As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board


As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap


As a player
So that I can win the game
I would like to be able to fire at my opponent's board


As a player
So that I can refine my strategy
I would like to know when I have sunk an opponent's ship


As a player
So that I know when to finish playing
I would like to know when I have won or lost


As a player
So that I can consider my next shot
I would like to be able to see my hits and misses so far


As a player
So that I can play against a human opponent
I would like to play a two-player game
```
