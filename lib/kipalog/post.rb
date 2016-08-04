module Kipalog
  class Post
    class << self
      def client
        Kipalog::APIClient.new
      end

      def preview(content)
        client.post('/post/preview', content: content)
      end

      def create(data)
        client.post('/post', data)
      end

      def hot
        client.get('/post/hot')
      end

      def newest
        client.get('/post/newest')
      end

      def bytag(tag_name)
        client.post('/post/bytag', { tag_name: tag_name })
      end
    end
  end
end
