
class Game
    attr :board
  def initialize
    row = Array.new(7, " ")
    @board = Array.new(6, row)
  end

  def draw_board
    puts "  1   2   3   4   5   6   7  "
    @board.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} |"
      puts "|---|---|---|---|---|---|---|"
    end
  end
end

class Player
  def initialize
  end

end
