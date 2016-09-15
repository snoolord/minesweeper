class Tile
  attr_accessor :bomb, :revealed, :flag

  def initialize(bomb)
    @bomb = bomb
    @revealed = false
    @flag = false
  end

  def flagify
    if @flag
      @flag = false
    else
      @flag =true
    end
  end

  def reveal
    @revealed = true
  end


end
