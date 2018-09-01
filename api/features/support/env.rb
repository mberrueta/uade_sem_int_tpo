# RedisDB.instance.redis = MockRedis.new
# Redis.current = MockRedis.new

require 'factory_bot'
require 'cucumber/rails'
require 'cucumber/rspec/doubles'

World(FactoryBot::Syntax::Methods)


begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  DatabaseCleaner.strategy = :truncation

rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'

end

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end