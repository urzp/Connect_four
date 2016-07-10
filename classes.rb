
class Game
    attr :board
  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    self.coin_toss
    row = Array.new(7, " ")
    @board = Array.new(6){ |i|  i = Array.new(7, " ") }
  end

  def turn(plase)
    marker = @player_turn.marker
    plase = plase - 1
    if @board.all? { |row| row[plase] == " " }
       @board[-1][plase] = marker
    else
      @board.each_with_index do |row, index|
        if row[plase] != " "
          #puts "row[plase] = #{row[plase]} inex= #{index-1} plase = #{plase}"
          @board[index-1][plase] = marker
          break
        end
      end
    end
    self.draw_board
    next_turn
  end

  def coin_toss
    if rand > 0.5
      @player_turn = @player_1
     else
      @player_turn = @player_2
    end
      return @player_turn
  end

  def who_turn?
    return @player_turn
  end

  def draw_board
    puts "  1   2   3   4   5   6   7  "
    @board.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} |"
      puts "|---|---|---|---|---|---|---|"
    end
  end
private
  def next_turn

     if @player_turn == @player_2
      @player_turn = @player_1
     else
       @player_turn = @player_2
     end
  end

end

class Player
  def initialize
  end

end
