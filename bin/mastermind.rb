require_relative '../lib/play'
require_relative '../lib/print_text'
require_relative '../lib/clean_text'


PrintText.intro

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
    PrintText.long_instructions
  else
    puts "Sorry, that's not an option."
  end
end
