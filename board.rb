# frozen_string_literal: true

# Board - holds the moves made
class Board
  attr_reader :game_over
  attr_accessor :position

  def initialize
    @gave_over = false
    @position = { a1: ' ', a2: ' ', a3: ' ', b1: ' ', b2: ' ', b3: ' ', c1: ' ', c2: ' ', c3: ' ' }
  end

  def go(player, move)
    loop do
      if position.key?(move.to_sym)
        if position[move.to_sym] == ' '
          position[move.to_sym] = player.token
          break
        else
          puts 'Already taken - try again'
          move = gets.chomp.downcase
        end
      else
        puts 'Invalid position - try again'
        move = gets.chomp.downcase
      end
    end

    puts
    puts '  A B C'
    puts "1 #{position[:a1]} #{position[:b1]} #{position[:c1]}"
    puts "2 #{position[:a2]} #{position[:b2]} #{position[:c2]}"
    puts "3 #{position[:a3]} #{position[:b3]} #{position[:c3]}"
    puts

    if (position[:a1] == player.token && position[:a2] == player.token && position[:a3] == player.token) ||
       (position[:b1] == player.token && position[:b2] == player.token && position[:b3] == player.token) ||
       (position[:c1] == player.token && position[:c2] == player.token && position[:c3] == player.token) ||
       (position[:a1] == player.token && position[:b1] == player.token && position[:c1] == player.token) ||
       (position[:a2] == player.token && position[:b2] == player.token && position[:c2] == player.token) ||
       (position[:a3] == player.token && position[:b3] == player.token && position[:c3] == player.token) ||
       (position[:a1] == player.token && position[:b2] == player.token && position[:c3] == player.token) ||
       (position[:c1] == player.token && position[:b2] == player.token && position[:a3] == player.token)
      puts "#{player.name} won!"
      @game_over = true
    elsif !position.key(' ')
      puts "It's a draw!"
      @game_over = true
    end
  end
end
