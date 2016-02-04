require_relative 'code'

class Player
  def initialize(name)
    @name = name.capitalize
    @current_guess = []
    @number_of_turns = 0
  end

  attr_reader :name, :current_guess
  attr_accessor :number_of_turns

  def guess(guess_string)
    @current_guess = guess_string.upcase.split("")
  end
end
