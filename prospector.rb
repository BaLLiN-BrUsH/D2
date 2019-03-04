# Class that creates the prospector, searches for rubys and moves between different cities
class Prospector
  def initialize(map, rng)
    @map = map
    @rng = rng
    @total_fake_rubies = 0
    @total_real_rubies = 0
    @total_days = 0
    init_rubies
  end

  # Find the index of the city
  def get_city_index(city)
    index = -1
    if city == 'Enumerable Canyon'
      index = 0
    elsif city == 'Monkey Patch City'
      index = 1
    elsif city == 'Duck Type Beach'
      index = 2
    elsif city == 'Matzburg'
      index = 3
    elsif city == 'Nil Town'
      index = 4
    elsif city == 'Hash Crossing'
      index = 5
    elsif city == 'Dynamic Palisades'
      index = 6
    end

    return nil if index == -1
    index
  end

  # Initialize the MAX amount of...
  # => REAL rubies = table[#,0]
  # => FAKE rubies = table[#,1]
  def init_rubies
    @table = [
      [1, 1], # Enumerable Canyon ==> 0
      [1, 1], # Monkey Patch City ==> 1
      [2, 2], # Duck Type Beach ==> 2
      [3, 0], # Matzburg ==> 3
      [0, 3], # Nil Town ==> 4
      [2, 2], # Hash Crossing ==> 5
      [2, 2] # Dynamic Palisades ==> 6
    ]
  end

  # Randomize the next location using the range
  def rand_num(range)
    num = @rng.rand(range) + 1
    num
  end

  # Get the next location using rand_num and return the index of that next location
  def next_loc(curr_loc)
    curr_loc = curr_loc.to_i
    return nil if curr_loc < 0 || curr_loc > 6
    range = @map[curr_loc].length - 2
    next_loc = rand_num(range).to_i

    next_loc += 1 if next_loc == 0
    return nil if next_loc.nil?

    puts "Heading from #{@map[curr_loc][0]} to #{@map[curr_loc][next_loc]}."
    get_city_index(@map[curr_loc][next_loc])
  end

  # Search for rubies with a given location
  def search_for_rubies(loc)
    curr_city = loc.to_i
    loop do
      @total_days += 1
      real_ruby = 0
      fake_ruby = 0
      real_ruby = @rng.rand(@table[curr_city][0]) if @table[curr_city][0] > 0
      fake_ruby = @rng.rand(@table[curr_city][1]) if @table[curr_city][1] > 0
      puts "      Found #{real_ruby} real ruby and #{fake_ruby} fake ruby in #{@map[curr_city][0]}" if real_ruby == 1 && fake_ruby == 1
      puts "      Found #{real_ruby} real rubies and #{fake_ruby} fake ruby in #{@map[curr_city][0]}" if real_ruby > 1 && fake_ruby == 1
      puts "      Found #{real_ruby} real ruby and #{fake_ruby} fake rubies in #{@map[curr_city][0]}" if real_ruby == 1 && fake_ruby > 1
      puts "      Found #{real_ruby} real rubies and #{fake_ruby} fake rubies in #{@map[curr_city][0]}" if real_ruby > 1 && fake_ruby > 1
      puts "      Found #{real_ruby} real ruby in #{@map[curr_city][0]}" if real_ruby == 1 && fake_ruby == 0
      puts "      Found #{real_ruby} real rubies in #{@map[curr_city][0]}" if real_ruby > 1 && fake_ruby == 0
      puts "      Found #{fake_ruby} fake ruby in #{@map[curr_city][0]}" if real_ruby == 0 && fake_ruby == 1
      puts "      Found #{fake_ruby} fake rubies in #{@map[curr_city][0]}" if real_ruby == 0 && fake_ruby > 1
      @total_real_rubies += real_ruby
      @total_fake_rubies += fake_ruby
      puts "      Found no rubies or fake rubies in #{@map[curr_city][0]}" if real_ruby == 0 && fake_ruby == 0
      break if real_ruby == 0 && fake_ruby == 0
    end
  end

  # Display findings after finishing journey
  def show_findings(curr_prosp)
    curr_prosp = curr_prosp.to_i
    return nil if curr_prosp <= 0
    puts "After #{@total_days} days, Rubyist ##{curr_prosp} found:" if @total_days > 1
    puts "After #{@total_days} day, Rubyist ##{curr_prosp} found:" if @total_days == 1
    if @total_real_rubies == 1
      puts "      #{@total_real_rubies} ruby."
    else
      puts "      #{@total_real_rubies} rubies."
    end
    if @total_fake_rubies == 1
      puts "      #{@total_fake_rubies} fake ruby."
    else
      puts "      #{@total_fake_rubies} fake rubies."
    end
    if @total_real_rubies >= 10
      puts "Going home victorious!"
    elsif @total_real_rubies > 0 && @total_real_rubies < 10
      puts "Going home sad."
    elsif @total_real_rubies == 0
      puts "Going home empty-handed."
    end
    puts "\n"
  end

end
