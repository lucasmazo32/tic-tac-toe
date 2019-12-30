#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative('../lib/player.rb')
require_relative('../lib/board.rb')

def until_player_choses(player, main_board)
  puts "Is your turn #{player.name}, select an empty space"
  election = gets.chomp
  until main_board.position(election, player.sym)
    print `clear`
    main_board.show.each { |line| puts line }
    puts "Incorrect value, please type a correct one #{player.name}."
    main_board.available.each { |x| print "#{x} " }
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
win_cond = true
turn = 0

# actual game loop
while win_cond
  print `clear`
  main_board.show.each { |line| puts line }
  main_board.available.each { |x| print "#{x} " }
  if turn.zero?
    until_player_choses(player1, main_board)
    turn = 1
  else
    until_player_choses(player2, main_board)
    turn = 0
  end
  win_cond = main_board.win_condition
end

print `clear`
main_board.show.each { |line| puts line }

if !main_board.available.empty? && turn == 1
  puts "#{player1.name} won"
elsif !main_board.available.empty?
  puts "#{player2.name} won"
else
  puts 'Everybody lose | You are losers'
end
