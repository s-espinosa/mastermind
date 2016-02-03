require_relative 'code'
require_relative 'game'
require_relative 'player'

def play
  puts "Please tell me your name:"
  player_name = gets.chomp
  player = Player.new(player_name)
  play_code = Code.new

  puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.
Use (q)uit at any time to end the game."
  puts "Please enter your guess"
  guess = gets.chomp
  colors_right = play_code.check_colors(player.guess(guess))
  positions_right = play_code.check_position(player.guess(guess))

  puts "'#{player.current_guess.join}' has #{colors_right} of the correct elements with #{positions_right} in the correct positions."
  puts "You've taken 1 guess."

end
