# Top level class documentation "super" important
class Calculator
  attr_reader :total

  def initialize
    @total = 0.0
  end

  def add(number)
    @total += number
  end

  def subtract(number)
    @total -= number
  end

  def multiply(number)
    @total *= number
  end

  def divide(number)
    if number == 0 || number == 0.0
      puts 'Error: cannot divide by zero'
    else
      @total /= number
    end
  end
end

# Question: when I divide a variable by zero it returns 'Infinity' which can't really be added to
# or subtracted from, obvi.  Though if I divide
# dividing in integer division will throw the ZeroDivisionError -- float division, on the
# other hand returns 'Infinity'
