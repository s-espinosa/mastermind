class Code
  def initialize
    @color_choices = ["R", "G", "B", "Y"]
    @code_array = ["R","G", "G", "B"]
    @code = @code_array.join
  end

  attr_reader :code

  def how_many_by_color(color_array)
    color_hash = {}
    @color_choices.each do |color|
      color_hash[color] = 0
    end
    color_array.each do |color|
        color_hash[color] += 1
    end
    color_hash
  end


  def check_colors(guess_array)
    code_hash = how_many_by_color(@code_array)
    guess_hash = how_many_by_color(guess_array)

    total_wrong = 0

    @color_choices.each do |color|
      total_wrong += code_hash[color] - guess_hash[color]
    end

    total_right = 4 - total_wrong
  end


  def check_position(guess_array)
    correct_position = 0

    @code_array.each_with_index do |color, index|
      correct_position += 1 if guess_array[index] == color
    end

    correct_position
  end
end
