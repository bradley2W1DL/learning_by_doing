require './lib/cash_register'

describe CashRegister do
  it 'should be an instance of the CashRegister class' do
    expect(subject).to be_a(CashRegister)
  end

  it 'should initialize with a total of $0.00' do
    expect(subject.total).to match('$0.00')
  end

  describe '#total' do
    it 'should return the total to two decimal places' do
      subject.purchase(4)
      expect(subject.total).to match('4.00')
    end
  end

  describe '#purchase' do
    it 'should add the amount of purchase to the total' do
      expect(subject.purchase(5.0)).to eq(5.00)
    end
  end

  describe '#pay' do
    it 'should deduct pay amount and return the new total' do
      subject.purchase(10)
      expect(subject.pay(7)).to eq(3.00)
    end

    it 'should not return a negative total' do
      subject.purchase(10)
      expect(subject.pay(15)).to_not eq(-5)
    end

    it 'should offer change if pay amount is greater than total' do
      subject.purchase(10)
      expect(subject.pay(15)).to match('Your change is: $5.00')
    end

    it 'should reset total to 0 after offering change.' do
      subject.purchase(10)
      subject.pay(15)
      expect(subject.total).to match('$0.00')
    end
  end
end
