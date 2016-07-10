

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

end


describe Player do
  it "Shold return Game Player" do
    player = Player.new
    expect(player).to be_instance_of Player
  end
end
