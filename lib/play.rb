require_relative 'game'
require_relative 'player'
require_relative 'print_text'
require_relative 'clean_text'

module Play
  def self.start_game
    difficulty = ask_difficulty
    game = Game.new(Player.new, difficulty)
    PrintText.short_instructions(difficulty)
    game.take_turn

    ask_play_again
  end

  def self.ask_difficulty
    puts "How difficult? (b)egginer, (i)ntermediate, (a)dvanced."
    difficulty = CleanText.getsmall
    if /[bia]/ =~ difficulty
      difficulty
    else
      ask_difficulty
    end
  end

  def self.ask_play_again
    puts "Would you like to play again? (y/n)"
    play_again = CleanText.getsmall

    check_play_again(play_again)
  end

  def self.check_play_again(play_again)
    if play_again == "y"
      start_game
    elsif play_again == "n"
      abort
    else
      puts "Sorry, that's not an option.\n\n"
      ask_play_again
    end
  end
end
