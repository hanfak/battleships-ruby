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
