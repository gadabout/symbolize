require 'rubygems'
require 'pry'
begin
  require 'spec'
rescue LoadError
  require 'rspec'
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'i18n'
require "i18n/backend/fallbacks"
I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.{rb,yml}')]

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

require 'mongoid'
puts "Using Mongoid v#{Mongoid::VERSION}"

Mongoid.configure do |config|
  # config.master = Mongo::Connection.new.db("symbolize_test")
  config.connect_to('symbolize_test')
end

Mongoid.logger.level = Logger::ERROR
Mongo::Logger.logger.level = Logger::ERROR

require 'symbolize/mongoid'

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
  end
end
