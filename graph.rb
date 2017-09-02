require 'gosu'
require_relative 'window'
require_relative 'equation'

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
      until x >= @window.max_x
        x += 1
      end
    end
  end

  def draw
    @window.draw_axes
  end
end

Graph.new(Window.new, [Equation.new("x^2")]).show
