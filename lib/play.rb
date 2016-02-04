require_relative 'game'
require_relative 'player'

module Play

  def self.start_game
    puts "initializing game (get name and make code)"
    #new_game = Game.new
    puts "Please enter your name:"
    player_name = gets.chomp
    #player = Player.new(player_name)

    play_again = true
    until play_again == false
      puts "playing game (giving guesses and responding)"
      #new_game.play

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
