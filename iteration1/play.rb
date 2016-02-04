require_relative 'code'
require_relative 'game'
require_relative 'player'
require 'pry'

# New to implement
# def short instructions
# def take player guess and return result

class Play
  def initialize(player_name)
    @player_name = player_name
    @player = Player.new(player_name)
    @current_code = Code.new
  end

  def self.short_instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow."
    puts "Use (q)uit at any time to end the game."
  end

  def self.get_player_name
    puts "Please tell me your name:"
    @player_name = gets.chomp
    self.short_instructions()
    @player_name
  end

  def take_turn
    puts "Please enter your guess"
    guess = gets.chomp
    if guess.length == 1
      case guess
      when "c"
        puts Code.code
        take_turn
      when "q"
        #quit
      else
        puts "Please enter a valid guess or (q)"
        take_turn
      end
    elsif guess.length == 4
      colors_right = @current_code.check_colors(@player.guess(guess))
      positions_right = @current_code.check_position(@player.guess(guess))
      @player.number_of_turns += 1

      if colors_right == 4 && positions_right == 4
        puts "Congratulations! That's correct!"
        play_again
      else
        puts "'#{@player.current_guess.join}' has #{colors_right} of the correct elements with #{positions_right} in the correct positions."
        puts "You've taken #{@player.number_of_turns} guess."
        take_turn
      end
    else
      puts "please enter a valid guess or (q)"
      take_turn
    end
  end

  def play_again
    puts "Would you like to play again? (y/n)"
    play_again = gets.chomp.split("").first.downcase
    if play_again == "y"
      short_instructions
      take_turn
    elsif play_again == "n"
      #quit
    else
      puts "Sorry, that's not an option."
      play_again
    end
  end
end
