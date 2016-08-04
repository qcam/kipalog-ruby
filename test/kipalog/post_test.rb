require 'test_helper'

describe Kipalog::Post do
  describe '.preview' do
    it 'returns json having the html of a markdown content' do
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
        with(body: request_body, headers: { 'Accept-Charset' => 'application/json', 'X-Kipalog-Token' => 'KIP-IT' }).
        to_return(status: 200, body: response_body)
      response = Kipalog::Post.preview(@markdown)

      assert_equal response_body, response.body
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

      assert_equal response_body, err.message
    end
  end

  describe '.create' do
    it 'calls POST request to create post' do
      data = {
        title: 'foo',
        tag: 'bar',
        status: 'published',
        content: '#data'
      }

      client = MiniTest::Mock.new
      client.expect(:post, '{}', ['/post', data])
      Kipalog::Post.stub(:client, client) { Kipalog::Post.create(data) }
      assert_mock client
    end
  end

  describe '.hot' do
    it 'gets the hot posts' do
      client = MiniTest::Mock.new
      client.expect(:get, '{}', ['/post/hot'])
      Kipalog::Post.stub(:client, client) { Kipalog::Post.hot }
      assert_mock client
    end
  end

  describe '.newest' do
    it 'gets the latest posts from client' do
      client = MiniTest::Mock.new
      client.expect(:get, '{}', ['/post/newest'])
      Kipalog::Post.stub(:client, client) { Kipalog::Post.newest }
      assert_mock client
    end
  end

  describe '.bytag' do
    it 'gets the latest posts from client' do
      client = MiniTest::Mock.new
      client.expect(:post, '{}', ['/post/bytag', { tag_name: 'foo' }])
      Kipalog::Post.stub(:client, client) { Kipalog::Post.bytag('foo') }
      assert_mock client
    end
  end
end
