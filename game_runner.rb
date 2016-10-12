#!/usr/bin/env ruby
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/ship'

puts 'Game setting up'

player1 = Player.new(Board.new)
player2 = Player.new(Board.new)
p Ship.new(1).class
player1_ships = [Ship.new(1), Ship.new(2), Ship.new(3), Ship.new(4)]
player2_ships = [Ship.new(1), Ship.new(2), Ship.new(3), Ship.new(4)]

puts 'Player 1: Add ships to board'

player1_ships.each do |ship|
  arr = player1.players_board.description
  arr.each do |r|
  puts r.each { |p| p }.join(" ")
end
  puts "add ship of size #{ship.size} to board"
  puts 'coordinate: '
  x , y =  gets.split.map(&:to_i)
  # puts 'decide orientation: vertical or empty for horizontal'
  # orientation = gets.chomp
  player1.add(ship, y, x)
end
