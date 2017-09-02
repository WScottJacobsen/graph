class Window
  attr_reader :min_x, :max_x, :min_y, :max_y, :x_scl, :y_scl, :width, :height
  def initialize(min_x = -10, max_x = 10, min_y = -10, max_y = 10, x_scl = 25, y_scl = 25, axes_width = 2)
    @min_x, @max_x, @min_y, @max_y, @x_scl, @y_scl, @axes_width = min_x, max_x, min_y, max_y, x_scl, y_scl, axes_width
    @width  = (@max_x - @min_x) * @x_scl
    @height = (@max_y - @min_y) * @y_scl
  end
  def draw_axes
    c = Gosu::Color.new(127, 255, 255, 255)
    Gosu.translate(-@min_x * @x_scl, 0) do
      Gosu.draw_rect(0, 0, @axes_width, @height, c)
    end
    Gosu.translate(0, @max_y * @y_scl) do
      Gosu.draw_rect(0, 0, @width, @axes_width, c)
    end
  end
end
