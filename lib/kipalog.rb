require "kipalog/version"

module Kipalog
  class << self
    def configure
      yield(config)
    end

    def config
      @config ||= Configuration.new
    end
  end

  class RequestError < ::StandardError; end
end

require 'kipalog/configuration'
require 'kipalog/post'
require 'kipalog/result'
require 'kipalog/api_client'

