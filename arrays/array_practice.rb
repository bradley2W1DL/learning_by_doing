#!/usr/bin/env ruby

array = (1..10).to_a

puts array.join('...') + '...'
puts "T-#{array.reverse.join(', ')}...  BLASTOFF!"
puts "The last element is #{array.last}"
puts "The first element is #{array.first}"
puts "The third element is #{array[2]}"
puts "The element with an index of 3 is #{array[3]}"
puts "The second from last element is #{array[-2]}"
puts "The first four elements are '#{array[0..3].join(', ')}'"
array.delete(5)
array.delete(6)
array.delete(7)
puts "If we delete 5, 6 and 7 from the array, we're left with [#{array.join(',')}]"
puts "If we add 5 at the beginning of the array, we're left with [#{array.insert(0, 5).join(',')}]"
puts "If we add 6 at the end of the array, we're left with [#{array.push(6).join(',')}]"
puts "Only the elements #{array.delete_if { |element| element < 9 } } are > 8."
array.clear
puts "If we remove all the elements, then the length of the array is #{array.length}"
