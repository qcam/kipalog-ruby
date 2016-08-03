require 'test_helper'

describe Kipalog::Result do
  it 'acts like a wrapper for kipalog result' do
    data = {
      content: "content",
      status: 401,
      cause: "error"
    }
    result = Kipalog::Result.new(data)

    assert_equal data[:content], result.content
    assert_equal data[:status], result.status
    assert_equal data[:cause], result.cause
  end

  describe '#ok?' do
    it 'returns ok when status code is 200' do
      data = {
        content: "content",
        status: 200,
        cause: "error"
      }
      result = Kipalog::Result.new(data)

      assert result.ok?
      assert_equal false, result.error?
    end

    it 'returns error when status code is 200' do
      data = {
        content: "content",
        status: 401,
        cause: "error"
      }
      result = Kipalog::Result.new(data)

      assert_equal false, result.ok?
      assert result.error?
    end
  end
end
