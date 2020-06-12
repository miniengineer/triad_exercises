# frozen_string_literal: true

require_relative 'exercise_generator'
require_relative 'triad_printer'

puts 'Hi! Wanna play a game?..'

sleep 2

puts "Don't be scared, it's a fun game!"

sleep 2

puts "Ready? 1. Yes 2. I don't feel like playing games today :("
ready_or_not = STDIN.gets.to_i

if ready_or_not == 1
  puts "Great! Let's start"
  sleep 2
else
  abort 'Well, maybe some other time.'
end

puts 'Click return/enter on you keyboard to see the answer'

sleep 1

puts 'If you want to finish game, type the word "end"'

sleep 1

printer = TriadPrinter.new

loop do
  new_game = ExerciseGenerator.new
  note = new_game.note
  string = new_game.string
  position = new_game.position
  answer = new_game.answer(string, position)

  puts "Play me a #{note} major in #{position} on strings #{string}!"
  next_move = STDIN.gets.chomp

  if next_move == 'exit'
    abort
  else
    puts 'Answer:'
    puts printer.result_printer(answer, note)
  end
end
