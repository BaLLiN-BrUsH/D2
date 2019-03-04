# This file runs all the tests for the ruby_rush.rb source code
# ruby_rush.rb does not need to be tested
# since it has fewer than 20 lines of code
require 'simplecov'
SimpleCov.start

require_relative 'check_num_args_test.rb'
require_relative 'simulator_test.rb'
require_relative 'prospector_test.rb'
