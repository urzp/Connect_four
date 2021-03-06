
ND = [[0,0],[0,1],[0,2],[0,3]]
NE = [[0,0],[1,1],[2,2],[3,3]]
ET = [[0,0],[1,0],[2,0],[3,0]]
SE = [[0,0],[1,-1],[2,-2],[3,-3]]
EH = [[0,0],[0,-1],[0,-2],[0,-3]]
EW = [[0,0],[-1,-1],[-2,-2],[-3,-3]]
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

  def get_board
    @board
  end

  def enimy?(player)
    return @player_1 if @player_1 != player
    return @player_2 if @player_2 != player
    return false
  end

  def turn(plase)
    marker = @player_turn.marker
    plase = plase - 1
    if @board.all? { |row| row[plase] != " " }
      puts "row is full take other row"
      return false
    end
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
        marker = board?(x,y)
        if marker != " "

          DERECTIONS.each do |der|
            line = der.map{ |pos| board?(x+pos[0], y + pos[1]) }
            if line.all?{ |i| i == marker }
              result = [ [x,y], der, marker ]
              #print "found pos=#{result[0]} der=#{der} marker=\"#{marker}\""
              #puts
              puts "Win of player with marker \"#{marker}\""
              return result
            end
          end
        end
      end
    end
    # puts "didn't find a win"
    return false
  end

  def board_full
    1.upto(7) do |x|
      1.upto(6) do |y|
        return false if board?(x,y) == " "
      end
    end
    return true
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
  attr :marker, :type, :board
  def initialize(marker, type = :human)
    @marker = marker
    @type = type
  end

  def see_enimy(einmy)
    @enimy = einmy
  end

  def turn(board)
    @board = board
    if @type == :human
      puts "Take your turn"
      puts "Puts number between 1 or 7"
      selection = 0
      while !selection.between?(1, 7)
        selection = gets.to_i
        if !selection.between?(1, 7)
          puts "Wrong placed number! Please put the number between 1..7 "
        end
      end
    else

      selection = find_win
      return selection if selection != false
      selection = find_blok
      return selection if selection != false
      selection = find_line_of_2
      return selection if selection != false
      selection = find_line_of_1
      return selection if selection != false
      selection = rand(7) + 1
      while !self.take_y(selection)
        selection = rand(7) + 1
      end
      return selection

    end
    return selection
  end

  def find_win
    find_line(3, self.marker)
  end

  def find_blok
    find_line(3, @enimy.marker)
  end

  def find_line_of_2
    find_line(2, self.marker)
  end

  def find_line_of_1
    find_line(1, self.marker)
  end

  def find_line(length, marker)
    1.upto(7) do |x|
      y = take_y(x)
      next if y == false
      #puts "x=#{x} y=#{y}"
      DERECTIONS.each do |der|
        line = der.map{ |pos| board?(x + pos[0], y + pos[1]) }
        mirror_line = der.map{ |pos| board?(x - pos[0], y - pos[1]) }
        #puts "x=#{x} y=#{y}"
        #print line[1..length]
        #puts
        #print mirror_line[1...4 - length]
        #puts
        if line[1..length].all?{ |i| i == marker } && mirror_line[1...4 - length].all?{ |i| i == " " || i == marker }

          return [x, y]
        end
      end
    end
    return false
  end

  def take_y(x)
    return false if @board.all? { |row| row[x - 1] != " " }
    return 1 if @board.all? { |row| row[x - 1] == " " }
    @board.each_with_index do |row, index|
      return 7 - index  if row[x - 1] != " "
    end
  end

  def board?(x,y)
    return false if x < 1 || x > 7
    return false if y < 1 || y > 6
    @board[6 -y][x-1]
  end

  def board=(board)
    @board = board
  end
end
