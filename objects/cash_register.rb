#!/usr/bin/env ruby

# Create a CashRegister class with methods to:
# initialize total, purchase: adds to total, and
# pay: deducts from total and returns change when appropriate.
class CashRegister
  def initialize
    @total = 0.00
  end

  def total
    @total.round(2)
  end

  def purchase(amount)
    # Make a purchase -- adds to total until pay is called
    @total += amount
  end

  def pay(amount)
    if amount < @total
      @total -= amount
      puts "Your new total is: $#{@total.round(2)}"
    else
      @total -= amount
      puts "Your change is: $#{@total.abs.round(2)}"
      @total = 0.00 # resets total to zero
    end
  end
end

register = CashRegister.new
puts register.total
register.purchase(3.78)
puts register.total
register.purchase(8.45)
puts register.total
register.pay(5.00)
puts register.total
register.pay(10)
