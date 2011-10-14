require 'mongoid'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("test")
end

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean