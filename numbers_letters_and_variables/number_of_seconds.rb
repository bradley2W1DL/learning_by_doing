#!/usr/bin/env ruby

seconds_in_minute = 60
mins_in_hour = 60
hours_in_day = 24
days_in_week = 7

puts "There are #{seconds_in_minute} seconds in a minute"
puts "There are #{mins_in_hour} minutes in an hour"
puts "There are #{hours_in_day} hours in a day"
puts "There are #{days_in_week} days in a week"
puts 'That means there are:'
seconds_in_hour = seconds_in_minute * mins_in_hour
puts "  #{seconds_in_hour} seconds in an hour,"
seconds_in_day = seconds_in_hour * hours_in_day
puts "  #{seconds_in_day} seconds in a day,"
seconds_in_week = seconds_in_day * days_in_week
puts "  #{seconds_in_week} seconds in a week"
puts
puts "That means when you turn 20, you've been alive for #{seconds_in_week * 52 * 20} seconds,"
puts "and if you make it to 100, you will have lived #{seconds_in_week * 5200} seconds. Make them count!"

# Rubocop gave me offenses for lines 20 and 21 being too long,
# but then Travis -CI didn't like having the lines split.
# So I just left them long.
