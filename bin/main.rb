#!/usr/bin/env ruby
require './lib/game'
require './lib/clear'

turorial_board = Board.new
turorial_board.example
demo_board = Board.new
demo_board.instructions
game_board = Board.new
turn = 1
game_on = true
next_turn, winner, draw = false

Screen.clear
puts 'Tic Tac Toe Game', ''
puts '', 'The object of Tic Tac Toe is to get three in a row. You play on a three by three game board.'
puts 'Players alternate placing Xs and Os on the game board until either oppent has three in a row
or all nine squares are filled.'
turorial_board.board.each do |arr|
  puts
  arr.each do |sub_arr|
    print sub_arr
  end
end
puts '', ''
print 'Press enter to start the game'
gets.chomp
Screen.clear

print 'Player 1 Name: '
input = gets.chomp
p1 = Player.new(input)
print 'Player 2 Name: '
input = gets.chomp
p2 = Player.new(input)
Screen.clear

puts '', "Let's Start!", ''
puts 'Choice a number between 1 and 9'
demo_board.board.each do |arr|
  puts
  arr.each do |sub_arr|
    print sub_arr
  end
end
puts '', ''

while game_on
  if turn.odd?
    print "#{p1.name} is your turn: "
  else
    print "#{p2.name} is your turn: "
  end
  input = gets.chomp
  Screen.clear
  unless next_turn
    if (input.to_i >= 1 && input.to_i <= 9) && turn.odd?
      p1.choices.push(input)
      puts "#{p1.name} choose #{p1.choices[-1]}", ''
      game_board.update_move(p1.choices[-1].to_i, 'X')
      next_turn = true
      turn += 1
      # Check if player 1 wins the game
      # Check if the game ends in a draw
    elsif input.to_i >= 1 && input.to_i <= 9
      p2.choices.push(input)
      puts "#{p2.name} choose #{p2.choices[-1]}", ''
      game_board.update_move(p2.choices[-1].to_i, 'O')
      next_turn = true
      turn += 1
      # Check if player 2 wins the game
      # Check if the game ends in a draw
    else
      puts 'Invalid movement. Try again.'
    end
    game_board.board.each do |arr|
      puts
      arr.each do |sub_arr|
        print sub_arr
      end
    end
    puts '', ''
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
      turn = 1
      winner, draw = false
    else
      game_on = false
    end
  end
end
