require 'minitest/autorun'
require_relative 'check_num_args'

# Class that tests CheckArgs class
class CheckNumArgsTest < Minitest::Test
  # UNIT TESTS FOR METHOD check_num_args(args)
  # Equivalence classes:
  # args= [-INFINITY..-1,-INFINITY..-1,-INFINITY..-1] -> returns false
  # args= [-INFINITY..INFINITY,1..INFINITY,1..INFINITY] -> returns true
  # args= (not a number) -> returns false
  # args= [-INFINITY..INFINITY,0,0] -> returns false

  # Test that no arguments on command line fails
  def test_check_num_args_invalid1
    args = CheckNumArgs.new
    assert_equal false, args.check_args([])
  end

  # Test that one arguments on command line fails
  def test_check_num_args_invalid2
    args = CheckNumArgs.new
    assert_equal false, args.check_args([1])
  end

  # Test that two arguments on command line fails
  def test_check_num_args_invalid3
    args = CheckNumArgs.new
    assert_equal false, args.check_args([1, 2])
  end

  # Test that string arguments on command line fails
  def test_check_num_args_string1
    args = CheckNumArgs.new
    assert_equal false, args.check_args(['HELLO'])
  end

  # Test that two string arguments on command line fails
  # EDGE CASE
  def test_check_num_args_string2
    args = CheckNumArgs.new
    assert_equal false, args.check_args(['HELLO', 'THERE'])
  end

  # Test that three string arguments on command line fails
  # EDGE CASE
  def test_check_num_args_string3
    args = CheckNumArgs.new
    assert_equal false, args.check_args(['HELLO', 'THERE', 'KENOBI'])
  end

  # Test that negative as an arguments on command line fails
  def test_check_num_args_invalid_negative
    args = CheckNumArgs.new
    assert_equal false, args.check_args([0,-1,-1])
  end

  # Test that zero as an arguments on command line fails
  def test_check_num_args_invalid_zero
    args = CheckNumArgs.new
    assert_equal false, args.check_args([0,0,0])
  end

  # Test valid arguments on command line pass
  def test_check_num_args_valid
    args = CheckNumArgs.new
    assert_equal true, args.check_args([1,1,1])
  end

  # Test the first argument is a valid int
  def test_check_num_args_valid2
    args = CheckNumArgs.new
    args.check_args([1,1,1])
    assert_kind_of Integer, 1
  end

end # End Class
