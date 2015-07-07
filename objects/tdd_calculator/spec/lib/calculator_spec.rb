require './lib/calculator'

describe Calculator do
  it 'should be a Calculator' do
    expect(subject).to be_a(Calculator)
    # `describe` will take 'subject' as an implicit instance
    # of the Calculator class.
    # This is basically doing the following:
    # calc = Calculator.new
    # expect(calc).to be_a(Calculator)
  end

  describe '#total' do
    it 'returns 0.00 for new calculators' do
      expect(subject.total).to eq(0.00)
    end
  end

  describe '#add(number)' do
    it 'can add positive numbers' do
      subject.add(5)
      expect(subject.total).to eq(5)
    end

    it 'can add negative numbers' do
      subject.add(-5)
      expect(subject.total).to eq(-5)
    end
  end

  describe '#subtract(number)' do
    it 'can subtract positive numbers' do
      subject.subtract(6)
      expect(subject.total).to eq(-6)
    end

    it 'can subtract negative numbers' do
      subject.subtract(-7)
      expect(subject.total).to eq(7)
    end
  end

  describe '#multiply(number)' do
    it 'can multiply positive numbers' do
      subject.add(2)
      subject.multiply(5)
      expect(subject.total).to eq(10)
    end

    it 'can multiply by a negative number' do
      subject.add(2)
      subject.multiply(-5)
      expect(subject.total).to eq(-10)
    end

    it 'returns 0 if total or argument is 0' do
      subject.multiply(5)
      expect(subject.total).to eq(0)
    end
  end

  describe '#divide(number)' do
    it 'can divide by a positive number' do
      subject.add(10)
      subject.divide(4)
      expect(subject.total).to eq(2.5)
    end

    it 'can divide by a negative number' do
      subject.add(10)
      subject.divide(-5)
      expect(subject.total).to eq(-2)
    end

    it 'throws an error when trying to divide by 0' do
      subject.divide(0)
      expect('Error: cannot divide by zero')
      expect(subject.total).to eq(0)
    end
  end
end
