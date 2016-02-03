require 'minitest/autorun'
require_relative 'code'

class Code_Test < Minitest::Test
  def test_it_has_a_code
    test_code = Code.new()
    assert !test_code.code.empty?
  end

  def test_it_returns_hashes_with_color_counts
    test_code = Code.new()

    guess_array = ["R", "R", "R", "R"]
    guess_hash = {"R" => 4, "G" => 0, "B" => 0, "Y" => 0}
    color_hash = test_code.how_many_by_color(guess_array)
    assert_equal guess_hash, color_hash
  end

  def test_it_checks_colors
    test_code = Code.new()

    guess = "RGRY"
    position_result = test_code.check_colors(guess)
    assert_includes 0..4, position_result
  end

  def test_it_identifies_all_correct_colors
    test_code = Code.new()

    guess = test_code.code
    assert_equal 4, test_code.check_colors(guess)
  end

  def test_it_identifies_all_correct_colors_regardless_of_case
    test_code = Code.new()

    guess = test_code.code.downcase
    assert_equal 4, test_code.check_colors(guess)
  end

  def test_it_checks_position
    test_code = Code.new()

    position_result = test_code.check_position("RGYB")
    assert_includes 0..4, position_result
  end

  def test_it_identifies_all_correct_positions
    test_code = Code.new()

    guess = test_code.code
    assert_equal 4, test_code.check_position(guess)
  end
end
