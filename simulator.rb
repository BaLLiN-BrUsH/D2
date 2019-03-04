require_relative 'prospector'

class Simulator
  def initialize(seed, num_of_prosp, num_of_turns)
    @seed = seed # Seed for Random Number Generator
    @prosp = num_of_prosp # Number of Prospectors
    @turns = num_of_turns # Number of Turns
  end

  # Execute the simulation
  def execute
    init_map
    rng = Random.new(@seed)
    num = 1
    while num <= @prosp
      rubyist = Prospector.new(@map, rng)
      iterate_on_location(num, rubyist)
      rubyist.show_findings(num)
      num += 1
    end
  end

  # Initialize map with cities/towns
  def init_map
    @map = [
      ['Enumerable Canyon', 'Monkey Patch City', 'Duck Type Beach'],
      ['Monkey Patch City', 'Nil Town', 'Matzburg', 'Enumerable Canyon'],
      ['Duck Type Beach', 'Matzburg', 'Enumerable Canyon'],
      ['Matzburg', 'Duck Type Beach', 'Monkey Patch City', 'Hash Crossing', 'Dynamic Palisades'],
      ['Nil Town', 'Moneky Patch City', 'Hash Crossing'],
      ['Hash Crossing', 'Matzburg', 'Dynamic Palisades', 'Nil Town'],
      ['Dynamic Palisades', 'Hash Crossing', 'Matzburg']
    ]
  end

  # Start the simulation for the 'curr_prosp' rubyist
  def iterate_on_location(curr_prosp, rubyist)
    curr_prosp = curr_prosp.to_i
    curr_loc = 0
    curr_turn = 0
    puts "Rubyist ##{curr_prosp} starting in #{@map[curr_loc][0]}"
    while curr_turn < @turns && curr_prosp > 0
      rubyist.search_for_rubies(curr_loc)
      curr_turn += 1
      curr_loc = rubyist.next_loc(curr_loc) unless curr_turn >= @turns
    end
  end
end
