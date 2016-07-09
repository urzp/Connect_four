

require '../classes'

describe Game do
  it "Shold return Game class" do
    game = Game.new
    expect(game).to be_instance_of Game
  end
end


describe Player do
  it "Shold return Game Player" do
    player = Player.new
    expect(player).to be_instance_of Player
  end
end
