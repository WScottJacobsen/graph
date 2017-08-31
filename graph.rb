require 'ruby2d'
require_relative 'RLine'

MIN_X = -10
MAX_X = 10
MIN_Y = -10
MAX_Y = 10
SCL   = 10

points   = []
lines    = []
eq       = "x^2"
accuracy = 10

set title: "Graph"#, width: (MAX_X - MIN_X) * SCL, height: (MAX_Y - MIN_Y) * SCL

def calc_y(x_pos)
  return x_pos ** 2
end

mouse_line = RLine.new(0, 0, 200, 200)

update do
  mouse_x = get :mouse_x
  mouse_y = get :mouse_y
  mouse_line.x2 = 20
  mouse_line.y2 = 20
end

show
