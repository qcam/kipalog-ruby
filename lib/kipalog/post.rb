module Kipalog
  class Post
    class << self
      def client
        Kipalog::APIClient.new
      end

      def preview(content)
        client.post('/post/preview', content: content)
      end
    end
  end
end
