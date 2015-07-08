# Top level biz -- This is a laundry machine
# To run the machine needs to be filled with clothes, have a cycle size chosen,
# detergent added, and then be started.
class LaundryMachine
  attr_reader :status, :cycle

  def initialize
    puts '''
       _______________________
      |_[]_____________[][][]_|
      |_______________________|
      |     __--------__      |
      |    / __-------__ \    |
      |   / /           \ \   |
      |  / /             \ \  |
      | | |#~~           ~| | |
      | | |###~~~       ~~| | |
      |  \ \######~##  ~~/ /  |
      |   \ \__#####~~__/ /   |
      |    \___=======___/    |
      |_______________________|
        v                   v

      '''
    puts <<-INSTRUCTIONS
      To run the LaundryMachine:
        1. Add clothes using #add_clothes
        2. Choose a cycle size with #chose_cycle_size
        3. Add detergent with #add_detergent \n
      You can then run the laundry machine with #start_cycle

      * Be sure to unload the machine (#unload) to reset the machine.
          INSTRUCTIONS
    # machine initializes empty by default
    @status = :empty
    # sets default cycle length in minutes
    @cycle = 20
  end

  def add_clothes # Add clothing to the washing machine
    if @status == :empty
      puts 'clothing added'
      @status = :full
    else
      puts 'There are already clothes in here'
    end
  end

  def chose_cycle_size(size = :not_set)
    if size == :not_set
      print 'Chose cycle size, type SM, MED, or LRG: '
      size = gets.chomp.upcase
    end

    size = size.upcase

    if size == 'LRG'
      @cycle *= 3
    elsif size == 'SM'
      @cycle *= 1
    elsif size == 'MED'
      @cycle *= 2
    else
      puts "That wasn't an option! No Laundry for you"
    end
    puts "cycle size #{size} has been selected."
    @cycle_select = true
  end

  def add_detergent
    if @status == :full && @cycle_select == true
      @detergent = true
      puts "Detergent added. You're ready to start this sucka!"
    elsif @status != :full
      puts 'you should put some clothes in the machine, man.'
      puts '(use .add_clothes to do this)'
    elsif @cycle_select != true
      puts 'make sure you select your cycle size first.'
      puts '(use .chose_cycle_size)'
    else
      puts "I don't even know what you're trying to do."
    end
  end

  def start_cycle
    if @detergent == true
      puts 'Laundry machine Running...'
      puts "This cycle will take #{@cycle} minutes."
      @clothes_clean = true
      # After cycle starts: Reset the cycle selections and detergent
      @detergent = false
      @cycle_select = false
    else # Error message that requirements aren't fulfilled to start machine.
      puts "Make sure you've added clothes, chosen a cycle size, and added detergent."
    end
  end

  def unload
    if @clothes_clean == true
      puts 'Good work doin your laundry -- be sure to put those in a dryer'
      @status = :empty
    elsif @detergent != true
      puts "You're missing some steps, these clothes aren't clean yet."
    end
  end

  def current_state
    puts "The machine is #{@status}"
    if @cycle_select == true
      puts "A cycle size has been selected"
    else
      puts "Cycle size has not yet been selected."
    end
    if @detergent == true
      puts 'Detergent has been added.'
    else
      puts 'No detergent has been added'
    end
  end
end


machine = LaundryMachine.new
puts '--------------'
machine.add_clothes
machine.chose_cycle_size('med')
machine.add_detergent
puts ''
puts 'Checking current state of machine...'
machine.current_state
puts '---------------'
machine.start_cycle
machine.unload
puts '---------------'
machine.current_state
