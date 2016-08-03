$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kipalog'

require 'minitest/autorun'
require 'webmock/minitest'

MiniTest::Test.class_eval do
  def setup
    Kipalog.configure do |config|
      config.api_key = 'KIP-IT'
    end
  end

  def teardown
    Kipalog.configure do |config|
      config.api_key = nil
    end
  end
end

