#!/usr/bin/env ruby
# frozen_string_literal: true

class Player
  attr_reader :name
  attr_reader :sym

  def initialize(sym, name)
    @sym = sym
    @name = name
  end
end

class Board
  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    show # try
  end

  def available
    @state.each_with_index { |x, index| print "#{index + 1} " if x == ' ' }
  end

  def position(num_pos, sym)
    check = true
    move = num_pos.to_i
    while check
      if move <= 9 && move >= 1 && (move.is_a? Integer) && @state[move - 1] == ' '
        @state[move - 1] = sym
        check = false
      else
        puts 'Incorrect value, please type a correct one.'
        available
        puts 'are the correct numbers'
        move = gets.chomp.to_i
      end
    end
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

  def win_condition
    (0...3).each do |i|
      if (@state[i * 3] == @state[i * 3 + 1] && @state[i * 3 + 1] == @state[i * 3 + 2] && @state[i * 3 + 2] != ' ') ||
         (@state[i] == @state[i + 3] && @state[i + 3] == @state[i + 6] && @state[i + 6] != ' ')
        return true
      end
    end
    if (@state[0] == @state[4] && @state[4] == @state[8] && @state[8] != ' ') ||
       (@state[2] == @state[4] && @state[4] == @state[6] && @state[6] != ' ')
      return true
    end

    false
  end
end

puts 'Player 1, type your name'
player1name = gets.chomp

puts 'Player 2, type your name'
player2name = gets.chomp

player1 = Player.new('X', player1name)
player2 = Player.new('O', player2name)
main_board = Board.new

# variables for win condition
win = false
counter = 0

# actual game loop
while counter < 9
  main_board.available
  if counter.even?
    puts "Is your turn #{player1.name}, select an empty space"
    election = gets.chomp
    main_board.position(election, player1.sym)
  else
    puts "Is your turn #{player2.name}, select an empty space"
    election = gets.chomp
    main_board.position(election, player2.sym)
  end
  win = main_board.win_condition
  break if win

  counter += 1
end

if win && counter.even?
  puts "#{player1.name} won"
elsif win
  puts "#{player2.name} won"
else
  puts 'Everybody lose | You are losers'
end
