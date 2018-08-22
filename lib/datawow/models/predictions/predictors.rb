module Datawow
  # :nodoc:
  class Predictor
    def all(options = {})
      options[:token] ||= Datawow.project_key
      options[:per_page] ||= 20
      options[:page] ||= 1
      connection.get('/api/prime/predictions', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/prime/predictions', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      options[:path_param] = true
      connection.get("/api/projects/images/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('ai')
    end
  end
end
