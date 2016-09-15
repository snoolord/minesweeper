class Tile
  attr_accessor :bomb, :revealed, :flag

  def initialize(bomb)
    @bomb = bomb
    @revealed = false
    @flag = false
  end

  def flagify
    @flag = true
  end

  def reveal
    @revealed = true
  end


end
