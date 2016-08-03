$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kipalog'

ENV['KIPALOG_API_KEY'] = 'KIP-IT'

require 'minitest/autorun'
require 'webmock/minitest'

ENV['KIPALOG_API_KEY'] = 'KIP-IT'
