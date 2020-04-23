#!/usr/bin/env ruby
p1_name = ''
p2_name = ''
p1_choices = []
p2_choices = []
input = ''

puts 'Tic Tac Toe Game'
print 'Player 1 Name: '
p1_name = gets.chomp
print 'Player 2 Name: '
p2_name = gets.chomp
puts "Let's Start!"
print 'Player 1 is your turn: '
input = gets.chomp
p1_choices.push(input)
puts 'Player 1 choice 3'
print 'Player 2 is your turn: '
input = gets.chomp
p2_choices.push(input)
puts 'Player 2 choice 1'

