require 'gosu'
require_relative 'window'
require_relative 'equation'
require_relative 'line'
require_relative 'point'

class Graph < Gosu::Window
  attr_accessor :eqs
  def initialize(window = Window.new, eqs = [], dp = 0.01)
    super window.width, window.height, false
    self.caption = "Graph"
    @eqs, @window = eqs, window
    @lines  = []
    @points = []
    @dp = dp
  end

  def needs_cursor?
      true
  end

  def update
    @lines  = []
    @points = []
    @eqs.each do |eq|
      x = @window.min_x
      prev_point = nil
      until x >= @window.max_x
        begin
          y = eq.calc_y x
          point = Point.new(x * @window.x_scl, -y * @window.y_scl, eq.color, 1)
          @points << point
          if(prev_point)
            @lines << Line.new(prev_point, point, eq.color)
          end
          prev_point = point
          x += eq.precision
        rescue
          #puts "Undefined point at x=#{x}"
          x += eq.precision
        end
      end
      eq.precision -= @dp
      eq.precision = [0.01, eq.precision, @window.width / @window.x_scl].sort[1]
    end
    sleep 0.1
  end

  def draw
    @window.draw_axes
    Gosu.translate(-@window.min_x * @window.x_scl, @window.max_y * @window.y_scl) do
      @lines.each do |line|
        line.draw
      end
      #@points.each do |pt|
      #  pt.draw
      #end
    end
  end
end

Graph.new(Window.new, [Equation.new("x ^ 3")]).show
#Graph.new(Window.new(-45, 20, -20, 20), [Equation.new("x ^ (1 / 3)")]).show
