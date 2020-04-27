#!/usr/bin/env ruby
require './lib/game'
require './lib/clear'

game_board = Board.new
game_rules = Rules.new
turn = 1
winner = ''
game_on = true
victory, draw = false
print_board = proc do |board|
  board.each do |arr|
    puts
    arr.each do |sub_arr|
      print sub_arr
    end
  end
end

Screen.clear
puts 'Tic Tac Toe Game', ''
puts '', 'The object of Tic Tac Toe is to get three in a row. You play on a three by three game board.'
puts 'Players alternate placing Xs and Os on the game board until either oppent has three in a row
or all nine squares are filled.'
game_board.example
print_board.call(game_board.board)
game_board = Board.new
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
game_board.instructions
print_board.call(game_board.board)
game_board = Board.new
puts '', ''

while game_on
  if turn.odd?
    print "#{p1.name} is your turn: "
  else
    print "#{p2.name} is your turn: "
  end
  input = gets.chomp
  Screen.clear
  if turn.odd? && game_rules.valid_move(input, p1.choices, p2.choices)
    p1.choices.push(input)
    puts "#{p1.name} choose #{p1.choices[-1]}", ''
    game_board.update_move(p1.choices[-1].to_i, 'X')
    turn += 1
    if game_rules.win_check(p1.choices)
      victory = true
      winner = p1.name
    end
  elsif turn.even? && game_rules.valid_move(input, p2.choices, p1.choices)
    p2.choices.push(input)
    puts "#{p2.name} choose #{p2.choices[-1]}", ''
    game_board.update_move(p2.choices[-1].to_i, 'O')
    turn += 1
    if game_rules.win_check(p2.choices)
      victory = true
      winner = p2.name
    end
  else
    puts 'Invalid movement. Try again.'
  end
  draw = game_rules.draw_check(turn)
  print_board.call(game_board.board)
  puts '', ''
  if victory || draw # rubocop:disable Style/Next
    if victory == true
      puts "#{winner} Wins the Game!"
      puts 'Congratulation!', ''
    elsif draw == true
      puts "It's a draw!", ''
    end
    puts 'You wanna play again? [Y/N]', ''
    input = gets.chomp
    if input.include?('N') || input.include?('n')
      game_on = false
    elsif input.include?('Y') || input.include?('y')
      game_on = true
      turn = 1
      victory, draw = false
      p1.choices = []
      p2.choices = []
      game_board = Board.new
    else
      game_on = false
    end
    Screen.clear
  end
end
