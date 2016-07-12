

require './classes'


  player_1 = Player.new("x",:human)
  player_2 = Player.new("o",:human)
  game = Game.new(player_1,player_2)

while true
  plase = player_1.turn
  game.turn(plase)
  plase = player_2.turn
  game.turn(plase)
end
