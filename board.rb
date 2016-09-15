require_relative "tile"
require "colorize"

class Board
  attr_accessor :grid
  def initialize(tiles)
    @grid = tiles
  end


  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def self.shuffle
    blank_tiles = []
    counter = 0

    1.upto(72) do
      blank_tiles << false
    end

    1.upto(9) do
      blank_tiles << true
    end

    blank_tiles.shuffle!

    tiles = Array.new(9) {[]}
    index = 0

    blank_tiles.each do |tile|
      tiles[index] << tile
      counter += 1
      index += 1 if counter % 9 == 0
    end

    tiles = tiles.map do |row|
      row.map do |tile|
        Tile.new(tile)
      end
    end

    self.new(tiles)


  end

  def render
    p String.colors
    puts "   "+(0..8).to_a.map{|num| num.to_s.colorize(:color => :red)}.join("   ")
    @grid.each_with_index do |row, idx|

      row = row.map do |tile|
       if tile.revealed
         " r "
       elsif tile.flag
         " f ".colorize(:color => :light_blue, :background => :red)
       elsif tile.bomb
         " X ".colorize(:color => :black, :background => :white)
       else
         " * ".colorize(:color => :white, :background => :light_black)
       end
     end.join('|')
    puts "#{idx}".colorize(:color => :red)+" " + row
    puts "--------------------------------------"
    end
  end
end
