require 'test_helper'

describe Kipalog::APIClient do
  before do
    @client = Kipalog::APIClient.new
  end

  describe '#get' do
    it 'sends GET request to path and returns result in Kipalog::Result' do
      @res_body = {
        content: 'FOO',
        status: 200,
        cause: ''
      }.to_json

      stub_request(:get, "http://kipalog.com/api/v1/foo").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'KIP-IT'}).
        to_return(status: 200, body: @res_body, headers: {})

      response = @client.get('/foo')
      assert_instance_of(Kipalog::Response, response)
      assert_equal(@res_body, response.body)
      assert_equal(200, response.status_code)
    end

    it 'raises RequestError if response is not ok' do
      @res_body = {
        content: '',
        status: 422,
        cause: 'foo'
      }.to_json
      stub_request(:get, "http://kipalog.com/api/v1/foo").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'KIP-IT'}).
        to_return(status: 422, body: @res_body, headers: {})

      err = assert_raises(Kipalog::RequestError) do
        @client.get('/foo')
      end

      assert_equal(@res_body, err.message)
    end
  end

  describe '#post' do
    before do
      @res_body = {
        content: 'FOO',
        status: 200,
        cause: ''
      }.to_json
      @req_body = {
        foo: 'bar'
      }.to_json
      stub_request(:post, "http://kipalog.com/api/v1/foo").
        with(body: @req_body, headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'KIP-IT'}).
        to_return(status: 200, body: @res_body, headers: {})
    end

    it 'sends GET request to path' do
      response = @client.post('/foo', { foo: 'bar' })
      assert_instance_of(Kipalog::Response, response)
      assert_equal(@res_body, response.body)
      assert_equal(200, response.status_code)
    end
  end
end
