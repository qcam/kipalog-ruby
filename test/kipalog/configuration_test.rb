require 'test_helper'

describe Kipalog::Configuration do
  describe '#initialize' do
    it 'takes KIPALOG_API_KEY as the api key if nothing was set' do
      ENV['KIPALOG_API_KEY'] = 'KIPALOG'

      config = Kipalog::Configuration.new

      assert_equal 'KIPALOG', config.api_key
    end

    it 'takes the api key passed in' do
      config = Kipalog::Configuration.new 'KIP-THE-KEY'

      assert_equal 'KIP-THE-KEY', config.api_key
    end
  end
end
