# frozen_string_literal: true

# Game class - accepts the player name, displays instructions and launches the game
class Game
  attr_reader :player1
  attr_reader :player2
  attr_reader :board

  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @board = Board.new
  end

  def play
    # Instructions
    puts 'Noughts and Crosses'
    puts '-------------------'
    puts ' '
    puts "Player 1 on X's is #{player1.name}"
    puts "Player 2 on O's is #{player2.name}"
    puts
    sleep 1
    puts 'Enter your position when prompted using this grid eg A1, B2 etc.'
    puts
    puts '  A B C'
    puts '1 . . .'
    puts '2 . . .'
    puts '3 . . .'
    puts

    # Play the game
    move = ''
    loop do
      puts "#{player1.name} where do you want to place your #{player1.token}?"
      move = gets.chomp.downcase
      board.go(player1, move)
      break if board.game_over

      puts "#{player2.name} where do you want to place your #{player2.token}?"
      move = gets.chomp.downcase
      board.go(player2, move)
      break if board.game_over
    end
  end
end
