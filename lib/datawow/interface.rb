# frozen_string_literal: true

module Datawow
  module Interface
    # :nodoc:
    def all(options = {})
      connector.get(path, options, @token)
    end

    def create(options)
      connector.create(path, options, @token)
    end

    def find_by(options = {})
      connector.get(path, options, @token)
    end

    private

    def connector
      @connection ||= Connector.new(type: @type)
    end
  end
end
