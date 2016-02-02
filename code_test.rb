require 'minitest/autorun'
require_relative 'code'

class Code_Test < Minitest::Test
  def test_it_has_a_code
    test_code = Code.new()
    test_code.code
  end

  def test_it_checks_colors
    test_code = Code.new()

    guess = "RGRY"
    position_result = test_code.check_colors(guess)
    position_result <= 4 && position_result >= 0
  end

  def test_it_identifies_all_correct_colors
    test_code = Code.new()

    guess = test_code.code
    test_code.check_colors(guess) == 4
  end

  def test_it_checks_position
    test_code = Code.new()

    position_result = test_code.check_position("RGYB")
    position_result <= 4 && position_result >= 0
  end

  def test_it_identifies_all_correct_positions
    test_code = Code.new()

    guess = test_code.code
    test_code.check_position(guess) == 4
  end


end
