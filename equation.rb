class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class Equation
  def initialize(eq, precision)
    @eq, @precision = eq, precision
    @parsed_eq = parse_eq(eq)
    @@precedence = ["^", "/", "*", "+", "-"]
  end

  def parse_eq(eq)
    infix = eq.split(' ').join('').split('')
    infix.map {|n| n.is_integer? ? n.to_i : n}
    val_stack = []
    postfix = ""
    infix.each do |ch|
      case ch
        when Fixnum
          postfix << ch
        when "("
          val_stack << ch
        when ")"
          while val_stack.first != "("
              postfix << val_stack.pop
          end
          val_stack.pop
        #when "+", "-", "*", "/", "^"
      end
    end
  end

  def precedence(ch)

  end

  def calc_y(x)
    substituted = @parsed_eq.map {|v| v == "x" ? x : v}
    num1 = num2 = nil
    substituted.each do |value|
      if(value.is_integer?)
        num1 = num1 ? value : num1
        num2 = num2 ? value : num2
      else

      end
    end
  end
end
