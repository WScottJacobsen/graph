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

mouse_line = R_Line.new(0, 0, 20, 20)

update do
  mouse_x = get :mouse_x
  mouse_y = get :mouse_y
  mouse_line.x2 = mouse_x
  mouse_line.y2 = mouse_y
  q = Quad.new(
  x1: 225, y1: 25,
  x2: 350, y2: 50,
  x3: 375, y3: 125,
  x4: 275, y4: 125,
  color: ['yellow', '#ff8c00', [0, 0, 0, 0], 'maroon']
)
end

show
