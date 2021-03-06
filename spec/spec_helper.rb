begin
  require 'simplecov'
  SimpleCov.start do
    add_filter "spec/"
  end
rescue LoadError
  puts "Skipping SimpleCov"
end

# require 'rspec/rails'
require 'delorean'
require 'json_spec'
require 'uuid'
require "crash_log"

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |file| require file }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Delorean
  config.include DefinesConstants

  config.before(:each) do
    setup_constants
  end

  config.after(:each) do
    teardown_constants
    CrashLog.reset_configuration!
  end
end
