#!/usr/bin/env ruby
require './lib/game'
require './lib/board'
require './lib/player'
require './lib/clear'

def print_board(board)
  board.each do |arr|
    puts
    arr.each do |sub_arr|
      print sub_arr
    end
  end
end

game_board = Board.new
game = Game.new
input = ''
game_on = true
valid = false

Screen.clear
puts 'Tic Tac Toe Game', ''
puts '', 'The object of Tic Tac Toe is to get three in a row. You play on a three by three game board.'
puts 'Players alternate placing Xs and Os on the game board until either oppent has three in a row
or all nine squares are filled.'
game_board.example
print_board(game_board.board)
game_board = Board.new
puts '', ''
print 'Press enter to start the game'
gets.chomp
Screen.clear

until valid
  print 'Player 1 Name: '
  input = gets.chomp
  Screen.clear
  if !input.strip.empty?
    p1 = Player.new(input.strip)
    valid = true
  else
    puts '', 'Please, enter a valid name.'
  end
end
valid = false
until valid
  print 'Player 2 Name: '
  input = gets.chomp
  Screen.clear
  if !input.strip.empty?
    p2 = Player.new(input.strip)
    valid = true
  else
    puts '', 'Please, enter a valid name.'
  end
end
Screen.clear

puts '', "Let's Start!", ''
game_board.default

while game_on
  print_board(game_board.board)
  puts '', '', 'Choose a number between 1 and 9'
  if game.turn.odd?
    print "#{p1.name} is your turn: "
  else
    print "#{p2.name} is your turn: "
  end
  input = gets.chomp
  Screen.clear
  if game.turn.odd? && game.valid_move(input, p1.choices, p2.choices)
    p1.choices.push(input)
    puts "#{p1.name} choose #{p1.choices[-1]}"
    game.update_game(p1, game_board, 'X')
    game.game_over(p1) if game.win_check(p1.choices)
  elsif game.turn.even? && game.valid_move(input, p2.choices, p1.choices)
    p2.choices.push(input)
    puts "#{p2.name} choose #{p2.choices[-1]}"
    game.update_game(p2, game_board, 'O')
    game.game_over(p2) if game.win_check(p2.choices)
  else
    puts 'Invalid movement. Try again.'
  end

  game.draw_check
  puts ''

  while game.end_game
    print_board(game_board.board)
    puts '', ''
    if game.victory
      puts "#{game.who_win?(p1, p2)} Wins the Game!"
      puts 'Congratulation!', ''
    else
      puts "It's a draw!", ''
    end

    puts 'You wanna play again? [Y/N]', ''
    input = gets.chomp.upcase
    if input == 'N'
      game_on = false
      break
    elsif input == 'Y'
      game.check_restart(p1, p2)
      game_board = Board.new
      game_board.default
    end
    Screen.clear
  end
end
