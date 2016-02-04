require_relative 'play'
require_relative 'instructions'

puts "Welcome to MASTERMIND\n"

def start
  puts "Would you like to (p)play, read the (i)nstructions, or (q)uit?"
  choice = ""
  choice = gets.chomp.split("").first.downcase

  case choice
  when "p"
    player_name = Play.get_player_name
    new_play = Play.new(player_name)
    new_play.take_turn
  when "i"
    Instructions.print_instructions
  when "q"
    #exit
  else
    puts "Sorry, that's not an option."
    start()
  end
end

start()
