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

    def post(path, data = {}, token = '')
      base_uri = base_point(@type)
      uri = URI.parse("#{base_uri}/#{@version_api}/#{path}")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = build_request(:POST, uri, token)
      request.set_form_data(data)
      response = https.request(request)
      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], 1)
    end

    def get(path, data = {}, token = '')
      base_uri = base_point(@type)
      uri = URI.parse("#{base_uri}/#{@version_api}/#{path}")
      uri.query = URI.encode_www_form(data)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = build_request(:GET, uri, token)
      response = https.request(request)
      body = JSON.parse response.body

      Response.new(body['data'], response.code, body['meta']['message'], body['meta'], body['meta']['total_count'])
    end

    private

    def build_request(method, uri, token)
      request = {}

      token = if Datawow.respond_to?(:project_key)
                Datawow.project_key
              else
                token
              end

      if (token || '').empty?
        raise ArgumentError, 'project\'s token has missed. To config about token check our document'
      end

      case method
      when :POST
        request = Net::HTTP::Post.new(uri.request_uri)
      when :GET
        request = Net::HTTP::Get.new(uri.request_uri)
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
        ai: 'https://kiyo-image.datawow.io/api',
        text: 'https://kiyo-text-staging.datawow.io/api',
        video: 'https://kiyo-image.datawow.io/api'
      }[type]
    end
  end
end
