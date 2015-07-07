#!/usr/bin/env ruby
# FizzBuzz Array Method variation

def fizz_buzz_array(array)
  fizzed_array = []
  array.each do |number|
    if number % 3 == 0 && number % 5 == 0
      fizzed_array.push('FizzBuzz')
    elsif number % 3 == 0
      fizzed_array.push('Fizz')
    elsif number % 5 == 0
      fizzed_array.push('Buzz')
    else
      fizzed_array.push(number)
    end
  end
  fizzed_array
end

one_to_hundred = (1..100).to_a

one_to_hundred_fizz_buzz = fizz_buzz_array(one_to_hundred)

puts one_to_hundred_fizz_buzz
