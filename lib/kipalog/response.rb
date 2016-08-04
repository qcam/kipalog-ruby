module Kipalog
  class Response
    attr_reader :status_code, :headers, :body

    def initialize(status_code, headers, body)
      @status_code = status_code
      @headers = headers
      @body = body
    end

    def ok?
      status_code == 200
    end

    def error?
      !ok?
    end
  end
end
