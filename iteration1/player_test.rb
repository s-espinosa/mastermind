require 'minitest/autorun'
require 'minitest/pride'
require_relative 'player'

class Player_Test < Minitest::Test
  def test_it_has_a_capitalized_name
    test_player = Player.new("george")
    assert_equal "George", test_player.name
  end

  def test_it_has_has_blank_initial_guess
    test_player = Player.new("george")
    assert_equal [], test_player.current_guess
  end

  def test_it_formats_guesses_as_upcased_arrays
    test_player = Player.new("george")
    test_player.guess("rggy")
    assert_equal ["R", "G","G", "Y"], test_player.current_guess
  end
end
