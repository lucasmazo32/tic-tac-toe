#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Hello World!'

# options for movement

square_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

# method to print the table every iteration
def state(arr)
  puts "#{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---------'
  puts "#{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---------'
  puts "#{arr[6]} | #{arr[7]} | #{arr[8]}"
end

#variables for win condition
draw = true
counter = 0

#actual game loop
while draw && counter < 9
  state(square_spaces)
  if counter.even?
    puts ' ' # mechanics for player 1 | puts to evade rubocop
  else
    puts '' # mechanics for plater 2 | puts to evade rubocop
  end
  counter += 1
  # wait = gets # gets for now so that it doesn't just loop 9 times
end

if draw
  # ther's a draw
elsif counter.even?
  puts 'X won'
else
  puts 'O won'
end
