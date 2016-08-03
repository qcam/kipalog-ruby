require 'virtus'

module Kipalog
  class Post
    include Virtus.model

    attribute :title, String
    attribute :content, String
    attribute :tag, String
    attribute :status, String

    class << self
      def client
        Kipalog::APIClient.new
      end

      def preview(content)
        result = client.post('/post/preview', content: content)

        if result.ok?
          result.content
        else
          raise RequestError, "#{result.status}: #{result.cause}"
        end
      end
    end
  end
end
