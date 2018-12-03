# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'uri'

require File.expand_path('client_response.rb', __dir__)

module Datawow
  # :nodoc:
  class Connector
    def initialize(type:, version_api: 'v1')
      @version_api = version_api
      @type = type
    end

    def create(path, data = {}, token = '')
      base_uri = base_point(@type)
      uri = URI.parse("#{base_uri}/#{@version_api}/#{path}")
      puts uri
      https = Net::HTTP.new(uri.host, uri.port)
      # https.use_ssl = true

      request = build_request(:POST, uri, token)
      request.set_form_data(data)
      response = https.request(request)
      result = handle_response(response)
      body = JSON.parse result.body

      Response.new(body["data"], result.code, result.message, body['meta'], 1)
    end

    private

    def build_request(method, uri, token)
      request = {}
      token ||= Datawow.project_key

      case method
      when :POST
        request = Net::HTTP::Post.new(uri.request_uri)
      when :GET
        request = Net::HTTP::Post.new(uri.request_uri)
      end

      request['User-Agent'] = 'Datawow Ruby gem client'
      request['Accept'] = 'application/json'
      request['Content-Type'] = 'application/json'
      request['Authorization'] = token

      request
    end

    def base_point(type)
      {
        image: 'http://localhost:3001/api',
        ai: 'https://kiyo-image.datawow.io',
        text: 'https://kiyo-text.datawow.io',
        video: 'https://kiyo-image.datawow.io'
      }[type]
    end

    def handle_response(response)
      case response
      when Net::HTTPSuccess
        response
      else
        response.value
      end
    end
  end
end
