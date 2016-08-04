require 'test_helper'

describe Kipalog::Configuration do
  describe '#initialize' do
    it 'takes the api key passed in' do
      config = Kipalog::Configuration.new 'KIP-THE-KEY'

      assert_equal 'KIP-THE-KEY', config.api_key
    end
  end
end
