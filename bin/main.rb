#!/usr/bin/env ruby
# frozen_string_literal: true

require('../lib/player.rb')
require('../lib/board.rb')

def until_player_choses(player, main_board)
  puts "Is your turn #{player.name}, select an empty space"
  election = gets.chomp
  until main_board.position(election, player.sym)
    print `clear`
    main_board.show.each { |line| puts line }
    puts 'Incorrect value, please type a correct one.'
    main_board.available.each_with_index { |x, index| print "#{index + 1} " if x == ' ' }
    puts 'are the correct numbers'
    election = gets.chomp.to_i
  end
end

print `clear`

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
  print `clear`
  main_board.show.each { |line| puts line }
  main_board.available.each_with_index { |x, index| print "#{index + 1} " if x == ' ' }
  if counter.even?
    until_player_choses(player1, main_board)
  else
    until_player_choses(player2, main_board)
  end
  win = main_board.win_condition
  break if win

  counter += 1
end

print `clear`
main_board.show.each { |line| puts line }

if win && counter.even?
  puts "#{player1.name} won"
elsif win
  puts "#{player2.name} won"
else
  puts 'Everybody lose | You are losers'
end
