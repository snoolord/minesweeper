require_relative 'board'
class MineSweeper

  def initialize(grid)
    @grid = grid
  end


  def play
    until game_over?
      puts "Give me your input: "
      pos = gets.chomp
      pos = pos.split(',').map(&:to_i)
      @grid[pos].flagify
      @grid[pos].reveal
      @grid.render
    end
  end
  def game_over?
    return true if won? || lost?
  end

  def won?

  end

  def lost?
    @grid.grid.each do |row|
      row.any? do |tile|
        return true if tile.revealed && tile.bomb
      end
    end
    return false
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.shuffle
  board.render
  minesweeper = MineSweeper.new(board)
  minesweeper.play
end
