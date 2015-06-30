#!/usr/bin/env ruby
# FizzBuzz Method

def fizz_buzz
  (1..100).each do |number|
    if number % 3 == 0 && number % 5 == 0
      puts 'FizzBuzz'
    elsif number % 3 == 0
      puts 'Fizz'
    elsif number % 5 == 0
      puts 'Buzz'
    else
      puts number
    end
  end
end

fizz_buzz
