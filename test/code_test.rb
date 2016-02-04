require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/code'
require_relative '../lib/player'

class Code_Test < Minitest::Test
  def test_it_has_a_code
    test_code = Code.new()
    assert !test_code.code.empty?
  end

  def test_it_returns_hashes_with_color_counts
    test_code = Code.new()
    test_player = Player.new("George")

    guess_array = test_player.guess("rrrr")
    guess_hash = {"R" => 4, "G" => 0, "B" => 0, "Y" => 0}
    color_hash = test_code.how_many_by_color(guess_array)
    assert_equal guess_hash, color_hash
  end

  def test_it_checks_colors
    test_code = Code.new()
    test_player = Player.new("George")

    guess = test_player.guess("RGRY")
    position_result = test_code.check_colors(guess)
    assert_includes 0..4, position_result
  end

  def test_it_identifies_all_correct_colors
    test_code = Code.new()
    test_player = Player.new("George")

    guess = test_player.guess(test_code.code)
    assert_equal 4, test_code.check_colors(guess)
    guess[3] == "G" ? incorrect_guess = guess.take(3) << "R" : incorrect_guess = guess.take(3) << "G"
    assert_equal 3, test_code.check_colors(incorrect_guess)
  end

  def test_it_checks_position
    test_code = Code.new()
    test_player = Player.new("George")

    position_result = test_code.check_position(test_player.guess("RGYB"))
    assert_includes 0..4, position_result
  end

  def test_it_identifies_all_correct_positions
    test_code = Code.new()
    test_player = Player.new("George")

    guess = test_player.guess(test_code.code)
    assert_equal 4, test_code.check_position(guess)

    guess[3] == "G" ? incorrect_guess = guess.take(3) << "R" : incorrect_guess = guess.take(3) << "G"
    assert_equal 3, test_code.check_position(incorrect_guess)
  end
end
