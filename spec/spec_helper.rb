require "bundler/setup"
require "rails"
require "active_record"
require "commenter"

RSpec.configure do |config|
  config.before :suite do
    ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
    load File.join(File.dirname(__FILE__), "support", "schema.rb")
    load File.join(File.dirname(__FILE__), "support", "models.rb")
  end
end
