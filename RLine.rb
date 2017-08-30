class RLine
  def initialize(x1, y1, x2, y2, line_width = 2, color = 'white'){
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
    @color, @line_width = color, line_width
    unit_x = (x2 - x1) / line_width
    unit_y = (y2 - y1) / line_width

    @qx1 = @x1 - unit_y * @line_width / 2,
    @qy1 = @y1 + unit_x * @line_width / 2,
    @qx2 = @x1 + unit_y * @line_width / 2,
    @qy2 = @y1 - unit_x * @line_width / 2,
    @qx3 = @x2 + unit_y * @line_width / 2,
    @qy3 = @y2 - unit_x * @line_width / 2,
    @qx4 = @x2 - unit_y * @line_width / 2,
    @qy4 = @y2 + unit_x * @line_width / 2,
    Quad.new(
      x1: @qx1, y1: @qy1,
      x2: @qx2, y2: @qy2,
      x3: @qx3, y3: @qy3,
      x4: @qx4, y4: @qy4,
      color: @color
    )
  }
end
