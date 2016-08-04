require 'test_helper'

describe Kipalog::Response do
  it 'stores responses information' do
    response = Kipalog::Response.new(200, {}, {}.to_json)

    assert_equal(200, response.status_code)
    assert_equal({}, response.headers)
    assert_equal('{}', response.body)
  end

  describe '#ok?' do
    it 'returns ok when status code is 200' do
      response = Kipalog::Response.new(200, {}, {}.to_json)

      assert response.ok?
      assert_equal false, response.error?
    end

    it 'returns error when status code is 200' do
      response = Kipalog::Response.new(422, {}, {}.to_json)

      assert_equal false, response.ok?
      assert response.error?
    end
  end
end
