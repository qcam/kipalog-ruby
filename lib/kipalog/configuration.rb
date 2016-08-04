module Kipalog
  class Configuration

    KIPALOG_API_KEY = 'KIPALOG_API_KEY'.freeze

    attr_accessor :api_key
    alias :token :api_key

    def initialize(api_key = '')
      @api_key = api_key
    end
  end
end
