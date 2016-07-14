

require './classes'


  player_1 = Player.new("x",:human)
  player_2 = Player.new("o",:human)
  game = Game.new(player_1,player_2)
  game.draw_board
  
while !game.check_win
  plaer = game.who_turn?
  plase = plaer.turn
  game.turn(plase)
end
