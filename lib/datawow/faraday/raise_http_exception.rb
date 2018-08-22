require 'faraday_middleware'

module Datawow
  module FaradayMiddleware
    class RaiseHttpException < Faraday::Middleware
      def call(request_env)
        @app.call(request_env).on_complete do |response|
          case response[:status].to_i
          when 200, 201
            # nothing to do here
          when 400
            error_message = error_message(response[:body])
            raise BadRequest, "#{response[:status]}: #{error_message}"
          when 403
            error_message = error_message(response[:body])
            raise NotPermitted, "#{response[:status]}: #{error_message}"
          when 404
            error_message = error_message(response[:body])
            raise NotFound, "#{response[:status]}: #{error_message}"
          else
            request_method = response[:method].to_s.upcase
            request_url = response[:url].to_s
            response_status = response[:status]
            error_message = error_message(response[:body])
            raise Error, "#{response_status}: #{request_method} #{request_url} #{error_message}"
          end
        end
      end

      private

      def error_message(response_body)
        if !response_body.nil? && response_body.is_a?(String)
          response_body = JSON.parse(response_body)
          response_body['message']
        end
      end
    end
  end
end
