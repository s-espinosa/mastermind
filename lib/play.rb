require_relative 'game'
require_relative 'player'
require_relative 'print_text'

module Play

  def self.start_game
    puts "Please enter your name:"
    player_name = gets.chomp
    player = Player.new(player_name)
    game = Game.new(player)


    play_again = true
    until play_again == false
      PrintText.short_instructions
      game.take_turn

      acceptable = false
      until acceptable == true
        puts "Would you like to play again? (y/n)"
        play_again = CleanText.getsmall

        case play_again
        when "y"
          play_again = true
          acceptable = true
        when "n"
          play_again = false
          acceptable = true
        else
          puts "Sorry, that's not an option.\n\n"
          acceptable = false
        end
      end
    end
  end
end
