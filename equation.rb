class String
  def is_numeric?
    self.to_f.to_s == self || self.to_i.to_s == self
  end
end

class Equation

  @@precedence = ["^", "/", "*", "+", "-"]

  attr_accessor :precision, :color
  attr_reader :eq

  def initialize(eq, precision = 2, c = Gosu::Color.new(255, rand(0..255), rand(0..255), rand(0..255)))
    @eq, @precision = eq, precision
    @parsed_eq = parse_eq(eq)
    @color = c
  end

  def parse_eq(eq)
    infix = eq.split(' ').join('').split('')
    infix.map! {|n| n.is_numeric? ? n.to_f : n}
    val_stack = []
    postfix = []
    infix.each do |val|
      case val
      when Numeric, "x", "X"
        postfix << val.to_s
      when "("
        val_stack << val
      when ")"
        while val_stack.last != "("
          postfix << val_stack.pop
        end
        val_stack.pop
      when "+", "-", "*", "/", "^"
        while !val_stack.empty? and val_stack.last != "(" and precedence(val) >= precedence(val_stack.last)
          postfix << val_stack.pop
        end
        val_stack << val
      end
    end
    while !val_stack.empty?
      postfix << val_stack.pop
    end
    return postfix
  end

  def precedence(ch)
    @@precedence.index ch
  end

  def calc_y(x)
    substituted   = @parsed_eq.map {|v| v == "x" ? x : v}
    substituted.map! {|n| n.is_a?(Numeric) ? n : n.is_numeric? ? n.to_f : n}
    postfix_stack = []
    answer = 0
    odd_den = nil
    substituted.each do |val|
      case val
      when Numeric
          postfix_stack << val
      else
        operand_2 = postfix_stack.pop
        operand_1 = postfix_stack.pop
        if(val != "^")
          odd_den = nil
        end
        case val
        when "+"
          answer = operand_1 + operand_2
        when "-"
          answer = operand_1 - operand_2
        when "*"
          answer = operand_1 * operand_2
        when "/"
          odd_den = operand_2 % 2 == 1
          answer = operand_1 / operand_2
        when "^"
          answer = operand_1 ** operand_2
          if(odd_den && operand_1 < 0)
            answer = answer.real * 2
          elsif(odd_den != nil && operand_1 < 0)
            raise "Imaginary Number"
          end
          odd_den = nil
        end
        postfix_stack << answer
      end
    end
    return postfix_stack.last
  end
end
