

require '../classes'

describe Game do
  it "Shold return Game class" do
    game = Game.new
    expect(game).to be_instance_of Game
  end


    it "shold put \"O\"  marker in the plase 1" do
      game = Game.new
      player_1 = double('player')
      player_2 = double('player')
      allow(player_1).to receive(:marker) {"O"}
      allow(player_2).to receive(:marker) {"X"}
      plase = 4
      game.turn(player_1, plase)
      plase = 4
      game.turn(player_2, plase)
   end
end


describe Player do
  it "Shold return Game Player" do
    player = Player.new
    expect(player).to be_instance_of Player
  end
end
