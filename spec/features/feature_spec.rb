feature 'user story 1' do
  scenario 'place ship on the board' do
    player = Player.new(Board.new)
    ship = Ship.new

    player.add(ship, 4, 2)

    game_board = [[0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,ship,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0]]

    expect(player.players_board.description).to eq game_board
  end
end

feature 'user story 2' do
  scenario 'place different size ships' do
    player = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)
    ship3 = Ship.new(6)

    # Places ship on board along the rows
    player.add(ship1, 4, 2)
    player.add(ship2, 1, 1)
    player.add(ship3, 6, 0)

    game_board = [[ship2,ship2,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,ship1,0,0,0,0],
                  [0,0,0,0,0,0],
                  [ship3,ship3,ship3,ship3,ship3,ship3]]

    expect(player.players_board.description).to eq game_board
  end
end

feature 'user story 3' do
  scenario 'place different size ships with different orientation' do
    player = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)
    ship3 = Ship.new(3)

    player.add(ship1, 4, 2)
    player.add(ship2, 1, 1)
    player.add(ship3, 4, 3, :vertical)

    game_board = [[ship2,ship2,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,ship1,ship3,0,0,0],
                  [0,0,ship3,0,0,0],
                  [0,0,ship3,0,0,0]]

    expect(player.players_board.description).to eq game_board
  end
end

feature 'user story 4' do
  scenario 'Ships should not go off board' do
    player = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)
    ship3 = Ship.new(3)

    player.add(ship1, 4, 2)

    message = "Out of bounds: starting position should be within game board boundary"
    expect{ player.add(ship2, 6, 6) }.to raise_error(message)

    player.add(ship3, 4, 3, :vertical)

    game_board = [[0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,ship1,ship3,0,0,0],
                  [0,0,ship3,0,0,0],
                  [0,0,ship3,0,0,0]]

    expect(player.players_board.description).to eq game_board
  end
end
