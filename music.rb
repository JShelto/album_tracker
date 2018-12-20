#!/usr/bin/env ruby
require 'optparse'
require './album'

puts "Welcome to your music collection!"


while command = gets.chomp
  case command
  when "exit"
    puts "Bye!"
    break
  else
  end
end