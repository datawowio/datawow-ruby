require File.expand_path('faraday/raise_http_exception.rb', __dir__)
require File.expand_path('client_response.rb', __dir__)

module Datawow
  # :nodoc:
  class Connection
    def initialize(model:, version_api: 'v1')
      @model = model
      @version_api = version_api
    end

    def get(path, options = {})
      @response = connection.get do |request|
        request.url("#{@version_api}#{path}")
        request.headers['Content-Type'] = 'application/json'
        request.headers['Authorization'] = options[:token] unless options[:token].nil?
        request.params = options[:path_param] ? params_url_options(options) : options
      end
      Response.new(data, status_code, message, meta, total)
    rescue Error, Faraday::Error => e
      handle_error(e)
    end

    def post(path, options = {}, query_params = {})
      @response = connection.post do |request|
        request.url("#{@version_api}#{path}")
        request.headers['Content-Type'] = 'application/json'
        request.headers['Authorization'] = options[:token] unless options[:token].nil?
        request.params = query_params
        request.body = options unless options.nil?
      end
      Response.new(data, status_code, message, meta, nil)
    rescue Error, Faraday::Error => e
      handle_error(e)
    end

    private

    def connection
      @connection ||= Faraday::Connection.new(base_point) do |connection|
        connection.request :url_encoded
        connection.request :json
        connection.response :json
        connection.use Datawow::FaradayMiddleware::RaiseHttpException
        connection.use :gzip
        connection.adapter Faraday.default_adapter
      end
    end

    def data
      @response.body['data']
    end

    def meta
      @response.body['meta']
    end

    def status_code
      meta['code'] unless meta.nil?
    end

    def message
      meta['message'] unless meta.nil?
    end

    def total
      meta['total_count'] unless meta.nil?
    end

    def handle_error(exception)
      if exception.is_a?(Faraday::ConnectionFailed)
        code = 599
        message = 'Connection Failed'
      else
        code = exception.to_s.partition(':').first
        message = exception.to_s.partition(':').last
      end

      Response.new(nil, code, message, nil)
    end

    def params_url_options(options)
      %i[id path_param].each { |e| options.delete(e) }
      options
    end

    def base_point
      options = {
        image: 'https://kiyo-image.datawow.io/api/',
        ai: 'https://kiyo-image.datawow.io/api/',
        text: 'https://kiyo-text.datawow.io/api/',
        video: 'https://kiyo-image.datawow.io/api/'
      }
      options[@model]
    end
  end
end
