#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Hello World!'

# options for movement

square_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def aviable_squares
  check = true
  while check
    avi = []
    square_spaces.each_with_index do |index, space|
      avi << index if space == ' '
    end
    move = gets.chomp
    if move <= 9 && move >= 1 && (move.is_a? Integer) && square_spaces[move - 1] == ' '
      check = false
    else
      puts 'wrong input'
    end
  end
  move
end

# method to print the table every iteration
def state(arr)
  puts "#{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '---------'
  puts "#{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '---------'
  puts "#{arr[6]} | #{arr[7]} | #{arr[8]}"
end

# variables for win condition
draw = true
counter = 0

# actual game loop
while draw && counter < 9
  state(square_spaces)
  if counter.even?
    puts 'player one\'s turn' # mechanics for player 1 | puts to evade rubocop
  else
    puts 'player two\'s turn' # mechanics for plater 2 | puts to evade rubocop
  end
  aviable_squares
  counter += 1
end

if draw
  # ther's a draw
elsif counter.even?
  puts 'X won'
else
  puts 'O won'
end
