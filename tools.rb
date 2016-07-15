

require './classes'


  player_1 = Player.new("x",:human)
  player_2 = Player.new("o",:comp)
  game = Game.new(player_1,player_2)
  player_1.see_enimy(game.enimy?(player_1))
  player_2.see_enimy(game.enimy?(player_2))
  game.draw_board

while !game.check_win
  plaer = game.who_turn?
  plase = plaer.turn(game.get_board)
  game.turn(plase)
end
