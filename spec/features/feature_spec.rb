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

feature 'user story 5' do
  scenario 'Ships should not overlap' do
    player = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)
    ship3 = Ship.new(3)
    ship4 = Ship.new(4)

    player.add(ship1, 4, 2)
    player.add(ship2, 1, 1)
    player.add(ship3, 4, 3, :vertical)

    message = "Ship already there: Choose another position so not overlap with a ship in that place"
    expect{ player.add(ship4, 6, 2) }.to raise_error message

    game_board = [[ship2,ship2,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,ship1,ship3,0,0,0],
                  [0,0,ship3,0,0,0],
                  [0,0,ship3,0,0,0]]

    expect(player.players_board.description).to eq game_board
  end
end

feature 'user story 6' do
  scenario "Player can fire on other player's board" do
    player1 = Player.new(Board.new)
    player2 = Player.new(Board.new)
    ship1 = Ship.new(2)
    ship2 = Ship.new(2)

    player1.add(ship1, 4, 2)
    player1.add(ship2, 1, 1)

    expect(player2.attack(player1, 1, 1)).to eq :hit
    expect(player2.attack(player1, 3, 5)).to eq :miss
    expect(player2.attack(player1, 4, 2)).to eq :hit
  end
end

feature 'user story 7' do
  scenario "Player can sink opponents ship" do
    player1 = Player.new(Board.new)
    player2 = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)

    player1.add(ship2, 1, 1)
    player1.add(ship1, 4, 3)

    expect(player2.attack(player1, 1, 1)).to eq :hit
    expect(player2.attack(player1, 2, 1)).to eq :miss
    expect(player2.attack(player1, 1, 2)).to eq :ship_sunk
  end
end

feature 'user story 8' do
  scenario "Player sink all opponents ship and wins" do
    player1 = Player.new(Board.new)
    player2 = Player.new(Board.new)
    ship1 = Ship.new
    ship2 = Ship.new(2)

    player1.add(ship1, 4, 3)
    player1.add(ship2, 1, 1)


    expect(player2.attack(player1, 1, 1)).to eq :hit
    expect(player2.attack(player1, 1, 2)).to eq :ship_sunk
    expect(player2.attack(player1, 4, 3)).to eq :won
  end
end


feature 'user story 9' do
  scenario "view opponents board" do
    player1 = Player.new(Board.new)
    player2 = Player.new(Board.new)
    ship1 = Ship.new(3)
    ship2 = Ship.new(2)

    player1.add(ship1, 4, 3, :vertical)
    player1.add(ship2, 1, 1)

    player2.attack(player1, 1, 1)
    player2.attack(player1, 2, 1)
    player2.attack(player1, 4, 3)

    opponents_board =   [[:hit,0,0,0,0,0],
                        [:miss,0,0,0,0,0],
                        [0,0,0,0,0,0],
                        [0,0,:hit,0,0,0],
                        [0,0,0,0,0,0],
                        [0,0,0,0,0,0]]
    # p player2.view_opponent_board(player1)
    expect(player2.view_opponent_board(player1)).to eq opponents_board
  end
end
