#!/usr/bin/env ruby

puts "Let's make a MadLib!"

verb = "verb ending in 'ing'"

# sets an array equal to all the various words that the MadLib needs.
words_array = ['adjective', 'adjective', 'noun', 'noun', 'plural noun', 'game', 'plural noun', verb,
verb, 'plural noun', verb, 'noun', 'plant', 'part of the body', 'place', verb, 'adjective',
'number', 'plural noun']

@response_array = []

# method to ask for a specific word and then add it to an array (@response_array).
def question(word)
  if word[0] == 'a'
    article = 'an'
  else
    article = 'a'
  end
  print "Give me #{article} #{word}: "
  response = gets.chomp
  @response_array.push(response)
end

# iterate through the words array, asking the 'Give me...' question for each
# word type in the 'words_array'
words_array.each do |mad_word|
  question(mad_word)
end

# Ruby Heredoc - Google it...

mad_lib = <<-END_OF_MADLIB
A vacation is when you take a trip to some #{@response_array[0]} place
with your #{@response_array[1]} family. Usually you go to some place
that is near a/an #{@response_array[2]} or up on a/an #{@response_array[3]}.
A good vacation place is one where you can ride #{@response_array[4]}
or play #{@response_array[5]} or go hunting for #{@response_array[6]}. I like
to spend my time #{@response_array[7]} or #{@response_array[8]}.
When parents go on a vacation, they spend their time eating
three #{@response_array[9]} a day, and fathers play golf, and mothers
sit around #{@response_array[10]}. Last summer, my little brother
fell in a/an #{@response_array[11]} and got poison #{@response_array[12]} all
over his #{@response_array[13]}. My family is going to go to (the)
#{@response_array[14]}, and I will practice #{@response_array[15]}. Parents
need vacations more than kids because parents are always very
#{@response_array[16]} and because they have to work #{@response_array[17]}
hours every day all year making enough #{@response_array[18]} to pay
for the vacation.
END_OF_MADLIB

print mad_lib
