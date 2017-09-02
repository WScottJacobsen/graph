class Line
  attr_accessor :p1, :p2
  def initialize(p1, p2, c = Gosu::Color.new(255, 255, 255, 255), line_width = 2)
    @p1, @p2, @color, @line_width = p1, p2, c, line_width
  end

  def draw
    @x1, @y1, @x2, @y2 = @p1.x, @p1.y, @p2.x, @p2.y
    dx = @x2 - @x1;
    dy = @y2 - @y1;
    line_length = Math.sqrt(dx ** 2 + dy ** 2);
    dx /= line_length;
    dy /= line_length;
    px = @line_width / 2 * dy;
    py = @line_width / 2 * dx;
    Gosu.draw_quad(
      @x1 - px, @y1 + py, @color,
      @x2 - px, @y2 + py, @color,
      @x2 + px, @y2 - py, @color,
      @x1 + px, @y1 - py, @color
    )
  end

  def to_s
    "{[#{@p1.x}, #{@p1.y}], [#{@p2.x}, #{@p2.y}]}"
  end
end
