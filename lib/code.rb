class Code
  def initialize(difficulty = "b")
    @all_colors = ["R", "G", "B", "Y", "O", "P"]
    @difficulty_hash = {"b" => [4, 4], "i" => [5, 6], "a" => [6, 8]}
    @color_choices = @all_colors.take(@difficulty_hash[difficulty][0])
    @code_array = [*1..@difficulty_hash[difficulty][1]].map{|n| @color_choices.sample}
    @code = @code_array.join
  end

  attr_reader :code, :color_choices

  def valid_colors?(guess_array)
    valid_array = true
    uniq_array = guess_array.uniq
    uniq_array.each do |color|
      valid_array = false if !@color_choices.include?(color)
    end
    valid_array
  end

  def check_colors(guess_array)
    total_wrong = 0
    @color_choices.each do |color|
      count_code = @code_array.find_all{|code_color| color == code_color}.length
      count_guess = guess_array.find_all{|guess_color| color == guess_color}.length
      color_difference = count_code - count_guess

      total_wrong += color_difference if color_difference > 0
    end

    total_right = @code_array.length - total_wrong
  end

  def check_position(guess_array)
    correct_position = 0
    @code_array.each_with_index do |color, index|
      correct_position += 1 if guess_array[index] == color
    end
    correct_position
  end
end
