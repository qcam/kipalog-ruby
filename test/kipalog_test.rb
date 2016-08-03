require 'test_helper'

describe Kipalog do
  describe '.configure' do
    it 'sets the api key' do
      Kipalog.configure do |config|
        config.api_key = 'FOO'
      end

      assert_equal 'FOO', Kipalog.config.api_key
    end

    after do
      Kipalog.configure do |config|
        config = nil
      end
    end
  end
end

