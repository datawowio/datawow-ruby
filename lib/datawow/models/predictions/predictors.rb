module Datawow
  # :nodoc:
  class Predictor
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get(path, options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post(path, options)
    end

    #  if endpoint is params you must set
    #  options[:path_param] = true
    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      options[:path_param] = true
      connection.get(path(options[:id]), options)
    end

    private

    def connection
      @connection ||= Connection.new('ai')
    end

    def path(id = nil)
      if id.nil?
        '/prime/predictions'
      else
        "/prime/predictions/#{id}"
      end
    end
  end
end
