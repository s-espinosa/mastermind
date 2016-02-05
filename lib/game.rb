require_relative 'code'
require_relative 'player'


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
    guess = gets.chomp.downcase

    if guess == "c"
      puts @secret_code.code
      take_turn
    elsif guess == "q"
      abort
    elsif guess.length > @secret_code.code.length
      puts "That guess is too long. Please enter a guess #{@secret_code.code.length} characters long or (q)."
      take_turn
    elsif guess.length < @secret_code.code.length
      puts "That guess is too short. Please enter a guess #{@secret_code.code.length} characters long or (q)."
      take_turn
    elsif guess.length == @secret_code.code.length
      if @secret_code.valid_colors?(@player.guess(guess))
        check_guess(guess)
      else
        puts "Please enter a valid guess using #{@secret_code.color_choices.join(", ")}, or (q)"
        take_turn
      end
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

  def time_finished
    @time_end = Time.new
  end

  def time_to_play
    @time_end - @time_start
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
end
