require_relative '../lib/play'
require_relative '../lib/instructions'
require_relative '../lib/clean_text'


puts "Welcome to MASTERMIND\n"

acceptable = false
until acceptable == true
  puts "Would you like to (p)play, read the (i)nstructions, or (q)uit?"
  choice = ""
  choice = CleanText.getsmall

  case choice
  when "p"
    Play.start_game
    acceptable = true
  when "q"
    acceptable = true
    abort
  when "i"
    Instructions.print_instructions
  else
    puts "Sorry, that's not an option."
  end
end
