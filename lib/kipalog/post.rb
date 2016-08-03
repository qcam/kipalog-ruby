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

        response = JSON.parse(request.parsed_response)

        if request.success?
          response["content"]
        else
          raise RequestError, "#{response["status"]}: #{response["cause"]}"
        end
      end
    end
  end
end
