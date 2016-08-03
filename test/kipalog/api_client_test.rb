require 'test_helper'

describe Kipalog::APIClient do
  before do
    @client = Kipalog::APIClient.new
  end

  describe '#get' do
    before do
      @res_body = {
        content: 'FOO',
        status: 200,
        cause: ''
      }
      stub_request(:get, "http://kipalog.com/api/v1/foo").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'KIP-IT'}).
        to_return(status: 200, body: @res_body.to_json, headers: {})
    end

    it 'sends GET request to path and returns result in Kipalog::Result' do
      result = @client.get('/foo')
      assert_instance_of(Kipalog::Result, result)
      assert_equal('FOO', result.content)
      assert_equal(200, result.status)
    end
  end

  describe '#post' do
    before do
      @res_body = {
        content: 'FOO',
        status: 200,
        cause: ''
      }
      @req_body = {
        foo: 'bar'
      }
      stub_request(:post, "http://kipalog.com/api/v1/foo").
        with(body: @req_body.to_json, headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'KIP-IT'}).
        to_return(status: 200, body: @res_body.to_json, headers: {})
    end

    it 'sends GET request to path' do
      expected = Kipalog::Result.new(@res_body)
      result = @client.post('/foo', { foo: 'bar' })
      assert_instance_of(Kipalog::Result, result)
      assert_equal(expected.content, result.content)
      assert_equal(expected.status, result.status)
    end
  end
end
