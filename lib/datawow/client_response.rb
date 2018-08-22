module Datawow
  class Response
    attr_reader :total, :message, :status
    attr_accessor :data, :meta

    def initialize(data, response_code = '', response_message = 'success', meta = nil, total = 0)
      @data = data
      @status = response_code
      @message = response_message
      @meta = meta
      @total = total unless total.nil?
    end

    def successful?
      [200, 201].include? status
    end
  end
end
