#!/usr/bin/env ruby
# frozen_string_literal: true

# options for movement

class Board
  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    show # try
  end

  def position(num_pos, sym)
    @state[num_pos] = sym
    show
  end

  # method to print the table every iteration
  def show
    puts "#{@state[0]} | #{@state[1]} | #{@state[2]}"
    puts '---------'
    puts "#{@state[3]} | #{@state[4]} | #{@state[5]}"
    puts '---------'
    puts "#{@state[6]} | #{@state[7]} | #{@state[8]}"
  end
end

class Player
  def initialize(sym)
    @sym = sym
  end
  
end

main_board = Board.new
player1 = Player.new('X')

# variables for win condition
draw = true
counter = 0

# actual game loop
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
