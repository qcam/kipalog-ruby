require 'test_helper'

describe Kipalog::Post do
  describe '#initialize' do
    it 'sets attributes' do
      data = {
        title: 'The title',
        content: "### Foo\nBar",
        tag: 'foo,bar',
        status: 'published'
      }
      post = Kipalog::Post.new(data)

      assert_equal data[:title], post.title
      assert_equal data[:content], post.content
      assert_equal data[:tag], post.tag
      assert_equal data[:status], post.status
    end
  end

  describe '.preview' do
    it 'returns the html of a markdown content' do
      @markdown = "# Foor\n```console.log('bar')```"
      @expected_html = "<h1>Foor</h1>\n\n<pre><code class=\"console.log('bar')```\"></code></pre>\n"

      request_body = {
        content: @markdown
      }.to_json

      response_body = {
        content: @expected_html,
        status: 200,
        cause: ""
      }.to_json

      stub_request(:post, "http://kipalog.com/api/v1/post/preview").
        with(body: request_body).
        to_return(status: 200, body: response_body)
      html = Kipalog::Post.preview(@markdown)

      assert_equal @expected_html, html
    end

    it 'raises error if the endpoint raises an error' do
      @markdown = "# Foor\n```console.log('bar')```"

      request_body = {
        content: @markdown
      }.to_json

      response_body = {
        content: "",
        status: 401,
        cause: "sorry, you giving us wrong api key :("
      }.to_json

      stub_request(:post, "http://kipalog.com/api/v1/post/preview").
        with(body: request_body).
        to_return(status: 422, body: response_body)

      err = assert_raises(Kipalog::RequestError) do |e|
        Kipalog::Post.preview(@markdown)
      end

      assert_equal "401: sorry, you giving us wrong api key :(", err.message
    end
  end
end
