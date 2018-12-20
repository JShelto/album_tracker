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
  if dc_command.start_with?("show all by")
    command.slice!("show all by")
    args = retrieve_args(command)
    Album.show_all_by(true, args[0])

  elsif dc_command.start_with?("show all")
    Album.show_all

  elsif dc_command.start_with?("show unplayed by")
    command.slice!("show unplayed by")
    args = retrieve_args(command)
    Album.show_all_by(false, args[0])

  elsif command.start_with?("show unplayed")
    Album.show_all_by(false)

  elsif dc_command.start_with?("show played by")
    command.slice!("show played by")
    args = retrieve_args(command)
    Album.show_all_by(true, args[0])

  elsif command.start_with?("show played")
    Album.show_all_by(true)

  elsif dc_command.start_with?("add")
    command.slice!("add")
    args = retrieve_args(command)
    Album.fabricate(args[0], args[1])

  elsif dc_command.start_with?("play")
    command.slice!("play")
    args = retrieve_args(command)
    Album.play(args[0], args[1])

  elsif dc_command.start_with?("remove")
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