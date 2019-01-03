# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'uri'
require 'json'

require File.expand_path('client_response.rb', __dir__)

module Datawow
  # :nodoc:
  class Connector
    def initialize(path, type, token: '', version_api: 'v1')
      @version_api = version_api
      @type = type
      @path = path
      @token = token
      @method = :GET
    end

    def post(data = {})
      @method = :POST
      response = send_request(data)

      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], 1)
    end

    def get(data = {}, query_str = true)
      @method = :GET
      response = send_request(data, query_str)
      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], body['meta']['total_count'])
    end

    def put(data = {})
      @method = :PUT
      response = send_request(data)
      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], 1)
    end

    def delete(data = {}, query_str = true)
      @method = :DELETE
      response = send_request(data, query_str)
      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], body['meta']['total_count'])
    end

    private

    def send_request(data = {}, query_str = true)
      base_uri = base_point(@type)
      url_base = "#{base_uri}/#{@version_api}/#{@path}"
      uri = URI.parse(url_base)

      if @method == :GET
        if query_str
          uri.query = URI.encode_www_form(data)
        else
          url_base = "#{url_base}/#{data[:id]}"
          uri = URI.parse(url_base)
        end
      end

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = build_request(uri)
      request.set_form_data(data)
      response = https.request(request)
    end

    def build_request(uri)
      request = {}
      token = @token || Datawow.project_key

      if (token || '').empty?
        raise ArgumentError, 'project\'s token has missed. To config about token check our document'
      end

      case @method
      when :POST
        request = Net::HTTP::Post.new(uri.request_uri)
      when :GET
        request = Net::HTTP::Get.new(uri.request_uri)
      when :PUT
        request = Net::HTTP::Put.new(uri.request_uri)
      when :DELETE
        request = Net::HTTP::Delete.new(uri.request_uri)
      else
        raise ArgumentError, 'HTTP method is not exist, We allowed GET, POST, PUT, DELET only'
      end

      request['User-Agent'] = 'Datawow Ruby gem client'
      request['Accept'] = 'application/json'
      request['Content-Type'] = 'application/json'
      request['Authorization'] = token

      request
    end

    def base_point(type)
      {
        image: 'https://kiyo-image.datawow.io/api',
        ai:    'https://kiyo-image.datawow.io/api',
        text:  'https://kiyo-text.datawow.io/api',
        video: 'https://kiyo-image.datawow.io/api'
      }[type]
    end
  end
end
