class Point
  attr_accessor :x, :y, :size
  def initialize(x = 0, y = 0, c = Gosu::Color.new(255, 255, 255, 255), size = 2)
    @x, @y, @color, @size = x, y, c, size
  end

  def draw
    Gosu.draw_rect(@x, @y, @size, @size, @color)
  end
end
