ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/rails_root/config/environment")

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'grip-rails'
require 'spec'
require 'spec/autorun'

require 'grip'
 
TEST_DB = 'test-grip-rails'
 
MongoMapper.database = TEST_DB

Spec::Runner.configure do |config|
  config.before(:all) do
    MongoMapper.database.collections.each do |coll|
      coll.remove
    end
	end
end

require 'models'

class TestGemLocator < Rails::Plugin::Locator
  def plugins
    Rails::Plugin.new(File.join(File.dirname(__FILE__), ".."))
  end
end

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.plugin_locators << TestGemLocator
end
