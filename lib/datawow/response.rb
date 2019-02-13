# frozen_string_literal: true

module Datawow
  class Response
    attr_reader :body, :code

    def initialize(body, code)
      @body = body
      @code = code.to_i
    end

    def successful?
      [200, 201].include? code
    end

    def data
      body['data']
    end

    def status
      code
    end

    def error
      body['error'] unless successful?
    end

    def message
      meta['message']
    end

    def meta
      body['meta']
    end

    def total
      meta['total_count'] || 0
    end
  end
end
