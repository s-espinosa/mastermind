require_relative 'code'
require_relative 'player'
require_relative 'print_text'
require_relative 'play'


class Game
  def initialize(difficulty)
    @time_start = Time.new
    @time_end = nil
    @secret_code = Code.new(difficulty)
    @player = Player.new
  end

  def take_turn
    guess = get_guess
    check_length(guess)
  end

  def get_guess
    puts "Please enter your guess."
    guess = gets.chomp.upcase
  end

  def check_length(guess)
    if guess.length == 1
      singlets(guess)
    elsif guess.length != @secret_code.code.length
      wrong_length(guess.length)
    else
      correct_length(guess)
    end
  end

  def singlets(guess)
    abort if guess == "Q"
    if guess == "C"
      puts @secret_code.code
    else
      puts "Please enter a valid guess or (q)"
    end
    take_turn
  end

  def wrong_length(length)
    if length > @secret_code.code.length
      puts "That guess is too long. Please enter a guess #{@secret_code.code.length} characters long or (q)."
    elsif length < @secret_code.code.length
      puts "That guess is too short. Please enter a guess #{@secret_code.code.length} characters long or (q)."
    end
    take_turn
  end

  def correct_length(guess)
    if @secret_code.valid_colors?(@player.guess(guess))
      check_guess(guess)
    else
      puts "Please enter a valid guess using #{@secret_code.color_choices.join(", ")}, or (q)"
      take_turn
    end
  end

  def check_guess(guess)
    colors_right = @secret_code.check_colors(@player.guess(guess))
    positions_right = @secret_code.check_position(@player.guess(guess))
    @player.number_of_turns += 1

    if colors_right == @secret_code.code.length && positions_right == @secret_code.code.length
      congrats
    else
      try_again(colors_right, positions_right)
    end
  end

  def congrats
    time_finished
    puts "Congratulations! You guessed the sequence '#{@secret_code.code}' in #{@player.number_of_turns} guesses over " + time_to_play
    @player.number_of_turns = 0
    Play.ask_play_again
  end

  def try_again(colors_right, positions_right)
    puts "'#{@player.current_guess.join}' has #{colors_right} of the correct elements with #{positions_right} in the correct positions."
    @player.number_of_turns == 1 ? puts("You've taken #{@player.number_of_turns} guess.") : puts("You've taken #{@player.number_of_turns} guesses.")
    take_turn
  end

  def time_finished
    @time_end = Time.new
  end

  def time_to_play
    minutes, seconds = minutes_seconds(@time_start, @time_end)

    if minutes == 1
      "1 minute, #{seconds} seconds."
    else
      "#{minutes} minutes, #{seconds} seconds."
    end
  end

  def minutes_seconds (time_start, time_end)
    time_taken = (time_end - time_start).to_i
    min_sec_array = [time_taken / 60, time_taken % 60]
  end
end
