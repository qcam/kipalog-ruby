module Kipalog
  class Result
    include Virtus.model

    attribute :content, String
    attribute :status, Integer
    attribute :cause, String

    def ok?
      status == 200
    end

    def error?
      !ok?
    end

    class << self
      def from_json(json_body)
        new(parse_json(json_body))
      end

      private

      def parse_json(json_body)
        JSON.parse(json_body, symbolize_name: true)
      end
    end
  end
end
