class Point
  attr_accessor :x, :y
  def initialize(x = 0, y = 0, c = Gosu::Color.new(255, 255, 255, 255))
    @x, @y, @color = x, y, c
  end

  def draw
    Gosu.draw_rect(@x, @y, 2, 2, @color)
  end
end
