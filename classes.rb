
ND = [[0,0],[0,1],[0,2],[0,3]]
NE = [[0,0],[1,1],[2,2],[3,3]]
ET = [[0,0],[1,0],[2,0],[3,0]]
SE = [[0,0],[1,-1],[2,-2],[3,-3]]
EH = [[0,0],[0,-1],[0,-2],[0,-3]]
EW = [[0,0],[-1,-1],[-1,-2],[-3,-3]]
WT = [[0,0],[-1,0],[-2,0],[-3,0]]
NW = [[0,0],[-1,1],[-1,2],[-3,3]]
DERECTIONS = [ ND, NE, ET, SE, EH, EW, WT, NW ]

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

  def board(x,y,symb)
    return false if x < 1 || x > 7
    return false if y < 1 || y > 6
    @board[6 -y][x-1] = symb
  end

  def board?(x,y)
    return false if x < 1 || x > 7
    return false if y < 1 || y > 6
    @board[6 -y][x-1]
  end

  def check_win
    1.upto(6) do |y|
      1.upto(7) do |x|
        if board?(x,y) != " "
          DERECTIONS.each do |der|
            line = der.map{ |pos| board?(x+pos[0], y + pos[1]) }
            if line.all?{ |i| i == marker }
              result = [ [x,y], der, marker ]
              return result
            end
          end
        end
      end
    end
    return false
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
