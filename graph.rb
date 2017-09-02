require 'gosu'
require_relative 'window'
require_relative 'equation'
require_relative 'line'
require_relative 'point'

class Graph < Gosu::Window
  attr_accessor :eqs
  def initialize(window = Window.new, eqs = [])
    super window.width, window.height, false
    self.caption = "Graph"
    @eqs, @window = eqs, window
    @lines = []
  end

  def needs_cursor?
      true
  end

  def update
    @eqs.each do |eq|
      x = @window.min_x
      prev_point = nil
      until x >= @window.max_x
        begin
          y = eq.calc_y x
          point = Point.new(x * @window.x_scl, -y * @window.y_scl)
          if(prev_point)
            @lines << Line.new(prev_point, point)
          end
          prev_point = point
          x += eq.precision
        rescue
          puts "undefined point"
          x += eq.precision
        end
      end
    end
  end

  def draw
    @window.draw_axes
    Gosu.translate(-@window.min_x * @window.x_scl, @window.max_y * @window.y_scl) do
      @lines.each do |line|
        line.draw
      end
    end
  end
end

Graph.new(Window.new(-45, 20, -20, 20), [Equation.new("3 * x + 5")]).show
