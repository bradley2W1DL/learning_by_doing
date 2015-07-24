class LaundryMachine
  attr_reader :machine_status

  def initialize
    @machine_status = {
      :status => :empty,
      :detergent => false,
      :cycle_select => false,
      :cycle => nil
    }

    def reset_machine
      @machine_status = {
        :status => :empty,
        :detergent => false,
        :cycle_select => false,
        :cycle => nil
      }
    end

    # comment out the below 8 lines to make the rspec output shorter
    puts '''
      To use the Laundry machine you must...
        1. Add some clothing (#add_clothes)
        2. Add some detergent (#add_detergent)
        3. Select a cycle_size: SM, MED, or LRG (#cycle_select)

      You can then run the machine by using #start_load
        - Be sure to unload the machine when it\'s done to reset the machine.
    '''
  end

  def add_clothes
    @machine_status[:status] = :full
    puts 'Clothes have been added'
  end

  def add_detergent
    @machine_status[:detergent] = true
    puts 'Detergent has been added.'
  end

  def cycle_select(size)
    # puts 'Chose cycle size: SM, MED, or LRG'
    # input = gets.chomp.upcase
    size = size.upcase
    if size == 'SM' || size == 'MED' || size == 'LRG'
      puts "#{size} cycle selected."
      @machine_status[:cycle] = size
      @machine_status[:cycle_select] = true
    else
      puts 'That isn\'t an option, you get MED'
      cycle_select('MED')
    end
  end

  def start_cycle
    if @machine_status[:status] == :empty
      puts 'Be sure to add clothes to the machine, using #add_clothes'
    elsif @machine_status[:detergent] == false
      puts 'Be sure to add detergent with #add_detergent'
    elsif @machine_status[:cycle_select] == false
      puts 'Be sure to select a cycle size with #cycle_select'
    else
      reset_machine
      puts 'Machine has been started...'
      puts 'Good work doing your laundry -- now put those in the dryer!'
    end
  end
end
