require_relative 'code'

class Player
  def initialize(name)
    @name = name.capitalize
    @current_guess = []
  end

  attr_reader :name, :current_guess

  def guess(guess_string)
    @current_guess = guess_string.upcase.split("")
  end
end
