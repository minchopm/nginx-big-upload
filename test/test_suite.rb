require 'rubygems'
gem 'test-unit'
require 'test/unit'

class TestSuite < Test::Unit::TestCase
  #empty class to fool IDE
end

def relative_path path
  File.expand_path("#{File.dirname(__FILE__)}/#{path}")
end

$VERBOSE = false
tests = Dir[relative_path("unit/*_test.rb")]
tests.each do |file|
  require(file)
end

if Test::Unit::AutoRunner.run
  require(relative_path("performance/performance_test.rb"))
  PerformanceTest.new.run
end