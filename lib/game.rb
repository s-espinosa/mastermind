require_relative 'code'
require_relative 'player'
require 'pry'


class Game
  def initialize(player)
    @time_start = Time.new
    @time_end = nil
    @secret_code = Code.new
    @player = player
  end


  def short_instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game."
  end


  def take_turn
    puts "Please enter your guess"
    guess = gets.chomp


    if guess == "c"
      puts @secret_code.code
      take_turn
    elsif guess == "q"
      #quit
    elsif guess.length == 4
      check_guess(guess)
    else
      puts "Please enter a valid guess or (q)"
      take_turn
    end
  end


  def check_guess(guess)
    colors_right = @secret_code.check_colors(@player.guess(guess))
    positions_right = @secret_code.check_position(@player.guess(guess))
    @player.number_of_turns += 1

    if colors_right == 4 && positions_right == 4
      puts "Congratulations! That's correct!"
      @player.number_of_turns = 0
      play_again
    else
      puts "'#{@player.current_guess.join}' has #{colors_right} of the correct elements with #{positions_right} in the correct positions.\nYou've taken #{@player.number_of_turns} guess."
      take_turn
    end
  end


  def play_again
    puts "Would you like to play again? (y/n)"
    play_again = CleanText.getsmall
    if play_again == "y"
      short_instructions
      @secret_code = Code.new
      take_turn
    elsif play_again == "n"
      abort
    else
      puts "Sorry, that's not an option."
      play_again
    end
  end


  def time_finished
    @time_end = Time.new
  end

  def time_to_play
    @time_end - @time_start
  end

end
