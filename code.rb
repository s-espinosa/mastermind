class Code
  def initialize        #(num_colors = 4)
                        #@num_colors = num_colors
    @code_array = ["R", "G", "G", "B"] #randomize this later, and maybe change to symbols?
    @code = @code_array.join
  end

  attr_reader :code

  def guess(guess_string)
    guess_array = guess_string.split
    if guess_array == @code_array
      time_end = Time.new
      puts "congrats!"
    else
      correct_colors = check_colors(guess_array)
      correct_position = check_position(guess_array)
      puts "You got #{correct_colors} colors correct and #{correct_position} in the correct position"
    end
  end

  def check_colors(guess_string)
    guess_array = guess_string.split
    code_colors_hash = {}
    num_wrong = 0

    @code_array.each do |letter|
      if code_colors_hash[letter]
        code_colors_hash[letter] += 1
      else
        code_colors_hash[letter] = 1
      end
    end

    guess_array.each do |letter|
      if code_colors_hash[letter] && code_colors_hash[letter] > 0
        code_colors_hash[letter] -= 1
      else
        num_wrong += 1
      end
    end

    num_right = @code_array.length - num_wrong
  end

  def check_position(guess_string)
    guess_array = guess_string.split
    positions_right = 0

    @code_array.each_with_index do |color, n|
      if color == guess_array[n]
        positions_right += 1
      end
    end

    positions_right
  end
end
