#!/usr/bin/env ruby
require './album'

puts "Welcome to your music collection!"


def start_program
  #user enters commands via command line as strings
  while command = gets.chomp
    if command == "exit"
      puts "Bye!"
      break
    else
      process_command_input(command)
    end
  end
end


#use the start of the input string to determine which Album method to call
def process_command_input(command)
  dc_command = command.downcase
  if dc_command.start_with?(/show all by/i)
    command.slice!(/show all by/i)
    args = retrieve_args(command)
    Album.show_where(nil, args[0])

  elsif dc_command.start_with?(/show all/i)
    Album.show_all

  elsif dc_command.start_with?(/show unplayed by/i)
    command.slice!(/show unplayed by/i)
    args = retrieve_args(command)
    Album.show_where(false, args[0])

  elsif command.start_with?(/show unplayed/i)
    Album.show_where(false, nil)

  elsif dc_command.start_with?(/show played by/i)
    command.slice!(/show played by/i)
    args = retrieve_args(command)
    Album.show_where(true, args[0])

  elsif command.start_with?(/show played/i)
    Album.show_where(true, nil)

  elsif dc_command.start_with?(/add/i)
    command.slice!("add")
    args = retrieve_args(command)
    Album.fabricate(args[0], args[1])

  elsif dc_command.start_with?(/play/i)
    command.slice!("play")
    args = retrieve_args(command)
    Album.play(args[0])

  elsif dc_command.start_with?(/remove/i)
    command.slice!("remove")
    args = retrieve_args(command)
    Album.remove(args[0])
  else
    puts "Command not found: #{command}" 
  end
end

#parses the remaining string for params after command as been removed
def retrieve_args(command)
  arr = command.split("\"")
  arr.delete(" ")
  arr
end

start_program()