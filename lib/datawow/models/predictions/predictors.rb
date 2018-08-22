module Datawow
  # :nodoc:
  class Predictor
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/prime/predictions', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/prime/predictions', options)
    end

    #  if endpoint is params you must set
    #  options[:path_param] = true
    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      options[:path_param] = true
      connection.get("/api/prime/predictions/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('ai')
    end
  end
end
