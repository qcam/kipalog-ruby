module Kipalog
  class Configuration

    KIPALOG_API_KEY = 'KIPALOG_API_KEY'.freeze

    attr_accessor :api_key

    def initialize(api_key = ENV[KIPALOG_API_KEY])
      @api_key = api_key
    end
  end
end
