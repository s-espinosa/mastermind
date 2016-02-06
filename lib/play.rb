require_relative 'game'
require_relative 'player'
require_relative 'print_text'

module Play

  # def self.get_name
  #   puts "Please enter your name:"
  #   player_name = gets.chomp
  #   player = Player.new(player_name)
  #   start_game(player)
  # end

  def self.start_game
    game = Game.new(Player.new)
    PrintText.short_instructions
    game.take_turn

    ask_play_again
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
