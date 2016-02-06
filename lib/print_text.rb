module PrintText
  def self.intro
    puts "WELCOME TO
___  ___  ___   _____ _____ ______________  ________ _   _______
|  \\/  | / _ \\ /  ___|_   _|  ___| ___ \\  \\/  |_   _| \\ | |  _  \\
| .  . |/ /_\\ \\\\ `--.  | | | |__ | |_/ / .  . | | | |  \\| | | | |
| |\\/| ||  _  | `--. \\ | | |  __||    /| |\\/| | | | | . ` | | | |
| |  | || | | |/\\__/ / | | | |___| |\\ \\| |  | |_| |_| |\\  | |/ /
\\_|  |_/\\_| |_/\\____/  \\_/ \\____/\\_| \\_\\_|  |_/\\___/\\_| \\_/___/  "
  end

  def self.long_instructions
    puts "\n_______________________________________________________________________________________"
    puts "\nWelcome to MASTERMIND. This is a game of guessing. I am going to pick a four color code \nusing red, green, blue, and yellow. Your job is to guess the code!\n\n"
    puts "After each guess, I will tell you the number of colors that you guessed correctly, \nand the number of colors that you guessed in the correct space.\n\n"
    puts "Guess all four colors correctly, and you win!\n\n"
    puts "_______________________________________________________________________________________\n\n"
  end

  def self.short_instructions
    puts "\n_______________________________________________________________________________________"
    puts "\nI have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, \n(b)lue, and (y)ellow.\n\nUse (q)uit at any time to end the game."
    puts "\n_______________________________________________________________________________________\n\n"
  end
end
