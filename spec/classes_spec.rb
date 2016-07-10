

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

    it "shold put \"O\"  marker in the plase 1" do
      plase = 4
      @game.turn(@player_1, plase)
      plase = 4
      @game.turn(@player_2, plase)
   end

   it "Shold return player_1 or player_2" do
     expect(@game.coin_toss.class).to eq RSpec::Mocks::Double
   end

end


describe Player do
  it "Shold return Game Player" do
    player = Player.new
    expect(player).to be_instance_of Player
  end
end
