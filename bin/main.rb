#!/usr/bin/env ruby
require './lib/game'
require './lib/clear'

default_board = Board.new
p_names = {}
p1_choices = []
p2_choices = []
turn = 1
game_on = true
next_turn, winner, draw = false

Screen.clear
puts 'Tic Tac Toe Game', ''
puts '', 'The object of Tic Tac Toe is to get three in a row. You play on a three by three game board.'
puts 'Players alternate placing Xs and Os on the game board until either oppent has three in a row
or all nine squares are filled.'
default_board.example.each do |arr|
  puts
  arr.each do |sub_arr|
    print sub_arr
  end
end
puts '', ''
print 'Press enter to start the game '
gets.chomp
Screen.clear

print 'Player 1 Name: '
input = gets.chomp
p1 = Player.new(input)
print 'Player 2 Name: '
input = gets.chomp
p2 = Player.new(input)

puts '', "Let's Start!", ''
# Display default board
while game_on
  if turn.odd?
    print "#{p1.name} is your turn: "
  else
    print "#{p2.name} is your turn: "
  end
  input = gets.chomp
  unless next_turn
    if (input.to_i >= 1 && input.to_i <= 9) && turn.odd?
      puts "#{p1.name} choice #{input}", ''
      p1_choices.push(input.to_i)
      next_turn = true
      turn += 1
      # Check if player 1 wins the game
      # Check if the game ends in a draw
    elsif input.to_i >= 1 && input.to_i <= 9
      puts "#{p2.name} choice #{input}", ''
      p2_choices.push(input.to_i)
      next_turn = true
      turn += 1
      # Check if player 2 wins the game
      # Check if the game ends in a draw
    else
      puts 'Invalid movement. Try again.'
    end
    # Display board with the recent move
  end
  next_turn = false
  draw = true if turn > 9
  if winner || draw # rubocop:disable Style/Next
    if winner == true
      puts "#{p2.name} Win the Game!"
      puts 'Congratulation!', ''
    elsif draw == true
      puts "It's a draw!", ''
    end
    puts 'You wanna play again? [Y/N]', ''
    input = gets.chomp
    if input.include?('N' || 'n')
      game_on = false
    elsif input.include?('Y' || 'y')
      game_on = true
      p1_choices = []
      p2_choices = []
      turn = 1
      winner, draw = false
    else
      game_on = false
    end
  end
end
