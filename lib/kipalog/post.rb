require 'virtus'
require 'httparty'

module Kipalog
  class Post
    include Virtus.model
    include HTTParty

    base_uri 'kipalog.com/api/v1/post'

    attribute :title, String
    attribute :content, String
    attribute :tag, String
    attribute :status, String

    class << self
      def preview(content)
        request = post(
          '/preview',
          body: {content: content}.to_json,
          headers: {
            'X-KIPALOG-TOKEN' => Kipalog.config.api_key
          }
        )

        result = Kipalog::Result.from_json(request.parsed_response)

        if result.ok?
          result.content
        else
          raise RequestError, "#{result.status}: #{result.cause}"
        end
      end
    end
  end
end
