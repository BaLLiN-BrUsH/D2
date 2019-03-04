require 'minitest/autorun'
require_relative 'simulator'

# Class that tests Simulator class
class SimulatorTest < Minitest::Test

  # UNIT TESTS FOR METHOD iterate_on_location(curr_prosp, rubyist) in Simulator Class
  # Equivalence classes:
  # curr_prosp = -INFINITY..-1 -> returns nil
  # curr_prosp = 1..INFINITY -> returns 1, and runs simulation as expected
  # takes up to @turns
  # curr_prosp = (not a number) -> returns nil
  # curr_prosp = 0 -> returns nil
  # rubyist = Object of type Prospector -> returns 1
  # rubyist = Object not of type Prospector -> returns nil

  # Test that negative value for curr_prosp returns nil
  # EDGE CASE
  def test_iterate_on_location_negative
    sim = Simulator.new(1, 2, 3)
    sim.init_map
    mock_rubyist = Minitest::Mock.new('Mock Prospector')
    def mock_rubyist.search_for_rubies(_param, _param2)
      1
    end

    def mock_rubyist.next_loc(_param)
      1
    end
    assert_nil sim.iterate_on_location(-1, mock_rubyist)
  end

  # Test that string value for curr_prosp returns nil
  def test_iterate_on_location_string
    sim = Simulator.new(1, 2, 3)
    sim.init_map
    mock_rubyist = Minitest::Mock.new('Mock Prospector')
    def mock_rubyist.search_for_rubies(_param, _param2)
      1
    end

    def mock_rubyist.next_loc(_param)
      1
    end
    assert_nil sim.iterate_on_location('HI', mock_rubyist)
  end

  # Test that a value of zero for curr_prosp returns nil
  # EDGE CASE
  def test_iterate_on_location_zero
    sim = Simulator.new(1, 2, 3)
    sim.init_map
    mock_rubyist = Minitest::Mock.new('Mock Prospector')
    def mock_rubyist.search_for_rubies(_param, _param2)
      1
    end

    def mock_rubyist.next_loc(_param)
      1
    end
    assert_nil sim.iterate_on_location(0, mock_rubyist)
  end

  # UNIT TESTS FOR METHOD set_map() in Simulator Class
  # Equivalence classes:
  # Accepts no parameters, but it is expected to ALWAYS, return the 2D
  # Array displayed below.

  def test_init_map
    map = [
      ['Enumerable Canyon', 'Monkey Patch City', 'Duck Type Beach'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg', 'Enumerable Canyon'],
      ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
      ['Matzburg', 'Duck Type Beach', 'Monkey Patch City', 'Hash Crossing', 'Dynamic Palisades'],
      ['Nil Town', 'Moneky Patch City', 'Hash Crossing'],
      ['Hash Crossing', 'Matzburg', 'Dynamic Palisades', 'Nil Town'],
      ['Dynamic Palisades', 'Hash Crossing', 'Matzburg']
    ]
    sim = Simulator.new(1, 2, 3)
    assert_equal map, sim.init_map
  end

end # End Class
