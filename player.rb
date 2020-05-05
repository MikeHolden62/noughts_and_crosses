# frozen_string_literal: true

# Player - holds the player attributes
class Player
  attr_reader :name
  attr_reader :token

  def initialize(name, token)
    @name = name
    @token = token
  end
end
