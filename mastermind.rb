require_relative 'play'
#require_relative 'instructions'

puts "Welcome to MASTERMIND\n"
choice = ""

puts "Would you like to (p)play, read the (i)nstructions, or (q)uit?"

choice = gets.chomp.downcase

case choice
when "p"
  play()
when "i"
  puts "User put i"
when "q"
  puts "User put q"
else
  puts "Sorry, that's not an option."
end
