require_relative 'game'
require_relative 'player'

module Play

  def self.start_game
    puts "Please enter your name:"
    player_name = gets.chomp
    player = Player.new(player_name)
    new_game = Game.new(player)


    play_again = true
    until play_again == false
      new_game.short_instructions
      new_game.take_turn

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
