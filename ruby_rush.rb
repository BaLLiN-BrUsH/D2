require_relative 'simulator'
require_relative 'check_num_args'

def display_usage
  puts 'Usage:'
  puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
  puts '*seed* should be an integer'
  puts '*num_prospectors* should be a non-negative integer'
  puts '*num_turns* should be a non-negaive integer'
  exit 1
end

# Set up the 'check_args' method
num_args = CheckNumArgs.new
valid_args = num_args.check_args ARGV

# Determine if the user entered the correct number/type of arguments
# => if so, execute the program with the arguments
# => if not, dispaly the usage message
if valid_args
  seed = ARGV[0].to_i
  num_of_prosp = ARGV[1].to_i
  num_of_turns = ARGV[2].to_i
  @run_sim = Simulator.new(seed, num_of_prosp, num_of_turns)
  @run_sim.execute
else
  display_usage
end
