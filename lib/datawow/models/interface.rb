# frozen_string_literal: true

module Datawow
  module Models
    module Interface
      def all(options = {})
        connector.get(path, options, @token)
      end

      def create(options)
        connector.post(path, options, @token)
      end

      def find_by(options = {})
        @query_str = true if @query_str.nil?
        connector.get(path, options, @token, @query_str)
      end

      private

      def connector
        @connection ||= Connector.new(type: @type)
      end
    end
  end
end
