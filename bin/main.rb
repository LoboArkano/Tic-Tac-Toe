#!/usr/bin/env ruby
require './lib/game'
require './lib/board'
require './lib/player'
require './lib/clear'

game_board = Board.new
game = Rules.new
winner = ''
input = ''
game_on = true
valid = false

Screen.clear
puts 'Tic Tac Toe Game', ''
puts '', 'The object of Tic Tac Toe is to get three in a row. You play on a three by three game board.'
puts 'Players alternate placing Xs and Os on the game board until either oppent has three in a row
or all nine squares are filled.'
game_board.example
game_board.show
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
puts 'Choice a number between 1 and 9'
game_board.instructions
game_board.show
game_board = Board.new
puts '', ''

while game_on
  if game.turn.odd?
    print "#{p1.name} is your turn: "
  else
    print "#{p2.name} is your turn: "
  end
  input = gets.chomp
  Screen.clear
  if game.turn.odd? && game.valid_move(input, p1.choices, p2.choices)
    game.update_game(p1, input, game_board, 'X')
    game.game_over(p1) if game.win_check(p1.choices)
  elsif game.turn.even? && game.valid_move(input, p2.choices, p1.choices)
    game.update_game(p2, input, game_board, 'O')
    game.game_over(p2) if game.win_check(p2.choices)
  else
    puts 'Invalid movement. Try again.'
  end

  game.draw_check
  game_board.show
  puts '', ''

  while game.end_game
    if game.victory
      puts "#{winner} Wins the Game!"
      puts 'Congratulation!', ''
    else
      puts "It's a draw!", ''
    end

    puts 'You wanna play again? [Y/N]', ''
    input = gets.chomp
    if input.include?('N') || input.include?('n')
      game_on = false
      break
    elsif input.include?('Y') || input.include?('y')
      game_on = true
      game.end_game = false
      game.turn = 1
      game.victory
      p1.choices = []
      p2.choices = []
      game_board = Board.new
    end
    Screen.clear
  end
end
