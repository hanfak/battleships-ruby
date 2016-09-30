feature 'user story 1' do
  scenario 'place ship on the board' do
    player = Player.new(Board.new)
    ship = Ship.new
    player.add(ship, 2, 3)

    game_board = [[0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,1,0,0,0,0],
                  [0,0,0,0,0,0],
                  [0,0,0,0,0,0]]

    expect(player.show_board).to eq game_board
  end
end
