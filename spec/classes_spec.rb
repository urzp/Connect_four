

require '../classes'



describe Game do
  before(:each) do
    @player_1 = double('Player')
    @player_2 = double('Player')
    allow(@player_1).to receive(:marker) {"O"}
    allow(@player_2).to receive(:marker) {"X"}
    @game = Game.new(@player_1, @player_2)
  end

  it "Shold return Game class" do
    expect(@game).to be_instance_of Game
  end

    it "shold swith betwen player_1 and player_2" do
      if @game.who_turn? == @player_1
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_2
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_1
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_2
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_1
      else
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_1
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_2
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_1
        plase = 4
        @game.turn(plase)
        expect(@game.who_turn?).to eq @player_2
      end

   end

context "Test #coin_toss" do
   it "Shold return player_1 or player_2" do
     expect(@game.coin_toss.class).to eq RSpec::Mocks::Double
   end
end

context "Test #who_turn?" do
   it "Shold return player_1 or player_2" do
     @game.coin_toss
     expect(@game.who_turn?.class).to eq RSpec::Mocks::Double
   end
end

context "test input and read board" do
  it "shold return false" do
     expect(@game.board(0,1,"x")).to eq false
  end

  it "shold return false" do
     expect(@game.board(1,0,"x")).to eq false
  end

end


context "test check_win pos 1,1 for \"x\" derection 0,1-0,2-0,3 " do
  it "shod draw_board" do
    @game.board(1,1,"x")
    @game.board(1,2,"x")
    @game.board(1,3,"x")
    @game.board(1,4,"x")
    @game.draw_board

    expect(@game.check_win.class).to eq Array
  end
end

context "test check_win pos 1,1 for \"o\" derection 0,1-0,2-0,3 " do
  it "shod draw_board" do
    @game.board(1,1,"o")
    @game.board(1,2,"o")
    @game.board(1,3,"o")
    @game.board(1,4,"o")
    @game.draw_board

    expect(@game.check_win.class).to eq Array
  end
end

context "test check_win pos 1,1 for not line \"o\" derection 0,1-0,2-0,3 " do
  it "shod draw_board" do
    @game.board(1,1,"o")
    @game.board(1,2,"o")
    @game.board(1,3,"x")
    @game.board(1,4,"o")
    @game.draw_board

    expect(@game.check_win).to eq false
  end
end

context "test check_win pos 1,1 for not line \"o\" derection 1,1-2,2-3,3 " do
  it "shod draw_board" do
    @game.board(1,1,"x")
    @game.board(2,2,"x")
    @game.board(3,3,"x")
    @game.board(4,4,"x")
    @game.draw_board

    expect(@game.check_win.class).to eq Array
  end
end

context "test check_win pos 1,1 for not line \"o\" derection 1,0-2,0-3,0 " do
  it "shod draw_board" do
    @game.board(1,1,"x")
    @game.board(2,1,"x")
    @game.board(3,1,"x")
    @game.board(4,1,"x")
    @game.draw_board

    expect(@game.check_win.class).to eq Array
  end
end

context "test check_win pos 1,1 for not line \"o\" derection (1,-1)-(2,-2)-(3,-3) " do
  it "shod draw_board" do
    @game.board(1,4,"x")
    @game.board(2,3,"x")
    @game.board(3,2,"x")
    @game.board(4,1,"x")
    @game.draw_board

    expect(@game.check_win.class).to eq Array
  end
end

context "test check_win for fulling randoms markers board" do
  it "shod draw_board" do
    1.upto(7) do |x|
      1.upto(6) do |y|
        if rand > 0.5
          marker = "x"
        else
          marker = "o"
        end
        @game.board(x,y,marker)
      end
    end

    @game.draw_board

    @game.check_win.class
  end
end


end



describe Player do
  it "Shold return Game Player" do
    player = Player.new
    expect(player).to be_instance_of Player
  end
end
