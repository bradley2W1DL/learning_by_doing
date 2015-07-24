require './lib/laundry_machine'

describe LaundryMachine do
  it 'should be an instance of the LaundryMachine class' do
    expect(subject).to be_a(LaundryMachine)
  end
  it 'a new LaundryMachine should initialize empty' do
    expect(subject.machine_status[:status]).to be(:empty)
  end
  it 'should provide some instructions to the user' do
    expect { subject }.to output.to_stdout
  end

  describe '#add_clothes' do
    it 'should change @status to :full' do
      subject.add_clothes
      expect(subject.machine_status[:status]).to be(:full)
    end

    it 'should let the user know that clothes have been added' do
      expect { subject.add_clothes }.to output(/Clothes have been added/).to_stdout
    end
  end

  describe '#add_detergent' do
    it 'should change @detergent => true, to show it\'s been added' do
      subject.add_detergent
      expect(subject.machine_status[:detergent]).to be(true)
    end

    it 'should let the user know that detergent has been added' do
      expect { subject.add_detergent }.to output(/Detergent/).to_stdout
    end
  end


  describe '#cycle_select' do
    it 'should set the cycle size' do
      subject.cycle_select('LRG')
      expect(subject.machine_status[:cycle]).to eq('LRG')
    end

    it 'should set to :cycle_select key to true in @machine_status' do
      subject.cycle_select('MED')
      expect(subject.machine_status[:cycle_select]).to eq(true)
    end

    it 'should let the user know a cycle size has been selected' do
      expect{ subject.cycle_select('SM') }.to output(/SM cycle selected/).to_stdout
    end

    it 'should set cycle size to the default, MED, if the user gives an invalid parameter.' do
      expect{ subject.cycle_select('big') }.to output(/isn't an option, you get MED/).to_stdout
    end
  end

  describe '#start_cycle' do
    it 'should check that clothes and detergent added, and the cycle has been selected.' do
      subject.add_clothes
      subject.add_detergent
      subject.cycle_select('SM')
      expect(subject.machine_status).to include(
          :status => :full,
          :detergent => true,
          :cycle_select => true,
          :cycle => 'SM'
        )
    end

    it 'should prompt user to #add_clothes if they haven\'t already' do
      expect{ subject.start_cycle }.to output(/Be sure to add clothes/).to_stdout
    end

    it 'prompt user to add detergent if #add_detergent hasn\'t been called' do
      subject.add_clothes
      expect(subject.machine_status[:detergent]).to eq(false)
      expect{ subject.start_cycle }.to output(/Be sure to add detergent/).to_stdout
    end

    it 'should prompt user to chose a cycle size if they haven\'t already' do
      subject.add_clothes
      subject.add_detergent
      expect(subject.machine_status[:cycle_select]).to eq(false)
      expect{ subject.start_cycle }.to output(/Be sure to select a cycle size/).to_stdout
    end

    it 'should let user know that the machine started' do
      subject.add_clothes
      subject.add_detergent
      subject.cycle_select('sm')
      expect{ subject.start_cycle }.to output(/Machine has been started/).to_stdout
    end

    it 'should reset the machine_status hash' do
      subject.add_clothes
      subject.add_detergent
      subject.cycle_select('sm')
      expect(subject.machine_status[:cycle]).to eq('SM')
      subject.start_cycle
      expect(subject.machine_status[:status]).to eq(:empty)
      expect(subject.machine_status[:detergent]).to eq(false)
      expect(subject.machine_status[:cycle_select]).to eq(false)
      expect(subject.machine_status[:cycle]).to eq(nil)
    end
  end
end
