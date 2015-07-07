#!/usr/bin/env ruby

# Recursive program for the classic American drinking song
# ~ ~ ~ ~ ~ ~ 99 Bottles of Beer ~ ~ ~ ~ ~ ~ ~ ~
# 99 bottles of beer on the wall, 99 bottles of beer.
#  Take one down and pass it around, 98 bottles of beer on the wall.

def plural(number)
  if number == 1
    return 'bottle'
  else
    return 'bottles'
  end
end

def beer_song(beers)
  puts "#{beers} #{plural(beers)} of beer on the wall, #{beers} #{plural(beers)} of beer."
  puts "Take one down and pass it around, #{beers - 1} #{plural(beers - 1)} of beer on the wall."
  puts ''
  if beers > 1
    beer_song(beers - 1)
  else
    puts 'No more bottles of beer on the wall, no more bottles of beer.'
    puts 'Go to the store and buy some more, 99 bottles of beer on the wall.'
  end
end

beer_song(99)
