require 'test_helper'

describe Kipalog::Configuration do
  describe '#initialize' do
    it 'takes KIPALOG_API_KEY as the api key if nothing was set' do
      ENV['KIPALOG_API_KEY'] = 'TEST'
      config = Kipalog::Configuration.new

      assert_equal 'TEST', config.api_key
      ENV['KIPALOG_API_KEY'] = nil
    end

    it 'takes the api key passed in' do
      config = Kipalog::Configuration.new 'KIP-THE-KEY'

      assert_equal 'KIP-THE-KEY', config.api_key
    end
  end
end
