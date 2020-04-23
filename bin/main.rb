#!/usr/bin/env ruby
p1_choices = []
p2_choices = []

puts 'Tic Tac Toe Game'
print 'Player 1 Name: '
p1_name = gets.chomp
print 'Player 2 Name: '
p2_name = gets.chomp
puts "Let's Start!"
print "#{p1_name} is your turn: "
input = gets.chomp
p1_choices.push(input)
puts "#{p1_name} choice #{input}"
print "#{p2_name} is your turn: "
input = gets.chomp
p2_choices.push(input)
puts "#{p2_name} choice #{input}"
print "#{p1_name} is your turn: "
input = gets.chomp
p1_choices.push(input)
puts "#{p1_name} choice #{input}"
print "#{p2_name} is your turn: "
input = gets.chomp
p2_choices.push(input)
puts "#{p2_name} choice #{input}"
print "#{p1_name} is your turn: "
input = gets.chomp
p1_choices.push(input)
puts "#{p1_name} choice #{input}"
print "#{p2_name} is your turn: "
input = gets.chomp
p2_choices.push(input)
puts "#{p2_name} choice #{input}"
puts "#{p2_name} won the game"
puts "#{p2_name} Win the Game!"
puts 'Congratulation!'
puts 'You wanna play again?'
