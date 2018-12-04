# frozen_string_literal: true

module Datawow
  module Interface
    # :nodoc:
    def all(options = {})
      connector.list(path, options, @token)
    end

    def create(options)
      connector.create(path, options, @token)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get(path(true), options)
    end

    private

    def connection
      @connection ||= Connection.new('image')
    end

    def connector
      @connection ||= Connector.new(type: :image)
    end
  end
end
