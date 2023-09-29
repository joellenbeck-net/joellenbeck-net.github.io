require 'bundler/setup'

require 'minitest/test_task'
Minitest::TestTask.create

require 'rspec/core/rake_task
RSpec::Core::RakeTask.new

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %i[test spec rubocop]
