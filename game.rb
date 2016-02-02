require_relative 'code'

time_start = Time.new

puts "Welcome to MASTERMIND\n"
puts "Would you like to (p)play, read the (i)nstructions, or (q)uit?"

choice = gets.chomp.downcase

case choice
when "p"
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.
  Use (q)uit at any time to end the game."
  puts "User put p."
when "i"
  puts "User put i"
when "q"
  puts "User put q"
else
  puts "Sorry, that's not an option."
end
