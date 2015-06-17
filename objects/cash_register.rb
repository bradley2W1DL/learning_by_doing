#!/usr/bin/env ruby

# Create a CashRegister class with methods to:
# initialize total, purchase: adds to total, and
# pay: deducts from total and returns change when appropriate.
class CashRegister
  def initialize
    @total = 0.00
  end

  def total
    sprintf("%.2f", @total)
  end

  def purchase(amount)
    # Make a purchase -- adds to total until pay is called
    @total += amount
  end

  def pay(amount)
    if amount < @total
      @total -= amount
      puts "Your new total is: $#{sprintf("%.2f", @total)}"
    else
      @total -= amount
      puts "Your change is: $#{sprintf("%.2f", @total.abs)}"
      @total = 0.00 # resets total to zero
    end
  end
end

register = CashRegister.new
puts register.total
register.purchase(3.78)
puts register.total
register.purchase(5.22)
puts register.total
register.pay(5.00)
puts register.total
register.pay(9.45)
puts register.total
