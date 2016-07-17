require '../classes'

describe Player do
  before(:each) do
    @player_1 = Player.new("x", :human)
    @player_2 = Player.new("o", :comp)
    @game = Game.new(@player_1, @player_2)
    @player_1.see_enimy(@game.enimy?(@player_1))
    @player_2.see_enimy(@game.enimy?(@player_2))
  end

context "test take_y" do

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

end

context "test win line" do

  it "Shold find win line find_line(3,\"x\")).to eq [4,1]" do
    @game.board(1,1,"x")
    @game.board(2,1,"x")
    @game.board(3,1,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_line(3,"x")).to eq [4,1]
  end

  it "Shold find find_line(3,\"x\")).to eq [1,4]" do
    @game.board(1,1,"x")
    @game.board(1,2,"x")
    @game.board(1,3,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_line(3,"x")).to eq [1,4]
  end

  it "Shold find find_line(3,\"x\")).to eq [4,4]" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"x")
    @game.board(4,1,"o")
    @game.board(4,2,"o")
    @game.board(4,3,"o")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_line(3,"x")).to eq [4,4]
  end

  it "Shold find win line find_line(2,\"x\")).to eq [5,1]" do
    @game.board(2,1,"o")
    @game.board(4,1,"x")
    @game.board(3,1,"x")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_line(2,"x")).to eq [5,1]
  end

  it "Shold find win line find_line(3,\"x\")).to eq [1,1]" do
    @game.board(2,1,"x")
    @game.board(3,1,"x")
    @game.board(4,1,"x")

    @game.draw_board
    board = @game.get_board
    @player_1.board = board
    expect(@player_1.find_line(3,"x")).to eq [1,1]
  end


  it "Shold find win line from [4,4]" do
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

context "test #find_blok" do

  it "Shold find blok line from [4,4]" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"x")
    @game.board(4,1,"o")
    @game.board(4,2,"o")
    @game.board(4,3,"o")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_blok).to eq [4,4]
  end

  it "Sholdn't find blok line false" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"x")
    @game.board(4,1,"o")
    @game.board(4,2,"o")

    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_blok).to eq false
  end

  it "Shold find blok line from [2,4]" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"o")
    @game.board(5,1,"o")
    @game.board(4,2,"o")
    @game.board(2,3,"o")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_blok).to eq [2,4]
  end

end

context "test #line_2" do

  it "Shold'n find  line_2 ==> find_line_of_2).to eq false " do
    @game.board(1,1,"o")
    @game.board(2,1,"o")
    @game.board(3,1,"o")
    @game.board(5,1,"x")
    @game.board(4,1,"x")
    @game.board(7,1,"o")
    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_line_of_2).to eq false
  end

  it "Shold find  line_2 ==> find_line_of_2).to eq [6,1] " do
    @game.board(1,1,"o")
    @game.board(2,1,"o")
    @game.board(3,1,"o")
    @game.board(5,1,"x")
    @game.board(4,1,"x")

    @game.draw_board
    board = @game.get_board
    @player_1.board = board

    expect(@player_1.find_line_of_2).to eq [6,1]
  end

end

end
