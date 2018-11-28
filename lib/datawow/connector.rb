require "net/http"
require "uri"

require File.expand_path('client_response.rb', __dir__)

module Datawow
  class Connector
    def initialize(model = nil, version_api = '/api/v1')
      @version_api = version_api
    end

    def send(path, method, options ={})


    end
  end
end
