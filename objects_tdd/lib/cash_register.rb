class CashRegister
  def initialize
    @total = 0
  end

  def total
    format('$%.2f', @total)
  end

  def purchase(amount)
    @total += amount
  end

  def pay(amount)
    if amount <= @total
      @total -= amount
    else
      change = (@total - amount).abs
      @total = 0
      "Your change is: $#{format('%.2f', change)}"
    end
  end
end
