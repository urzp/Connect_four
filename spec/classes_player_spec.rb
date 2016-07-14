require '../classes'

describe Player do
  before(:each) do
    @player_1 = Player.new("X", :human)
    @player_2 = Player.new("O", :comp)
    @game = Game.new(@player_1, @player_2)
  end


  it "Should return y" do
  @game.board(2,1,"x")
  @game.board(2,2,"x")
  @game.board(2,3,"x")
  @game.draw_board
  board = @game.get_board

  expect(@player_1.take_y(board,2)).to eq (4)
  end


  it "Should return y" do
  @game.board(1,1,"x")
  @game.board(1,2,"x")
  @game.draw_board
  board = @game.get_board

  expect(@player_1.take_y(board,1)).to eq (3)
  end
end
