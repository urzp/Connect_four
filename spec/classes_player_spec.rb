require '../classes'

describe Player do
  before(:each) do
    @player_1 = Player.new("x", :human)
    @player_2 = Player.new("O", :comp)
    @game = Game.new(@player_1, @player_2)
  end


  it "Should return y = 4" do
    @game.board(2,1,"x")
    @game.board(2,2,"x")
    @game.board(2,3,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.take_y(2)).to eq (4)
  end


  it "Should return y = 3" do
    @game.board(1,1,"x")
    @game.board(1,2,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.take_y(1)).to eq (3)
  end

  it "Shold find win line" do
    @game.board(1,1,"x")
    @game.board(2,1,"x")
    @game.board(3,1,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_win).to eq [4,1]
  end

  it "Shold find win line" do
    @game.board(1,1,"x")
    @game.board(1,2,"x")
    @game.board(1,3,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_win).to eq [1,4]
  end

  it "Shold find win line" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"x")
    @game.board(4,1,"o")
    @game.board(4,2,"o")
    @game.board(4,3,"o")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_win).to eq [4,4]
  end

end
