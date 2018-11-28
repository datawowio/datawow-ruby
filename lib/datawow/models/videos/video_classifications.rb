module Datawow
  # :nodoc:
  class VideoClassification
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
      options[:token] ||= Datawow.project_key
      options[:path_param] = true
      connection.get(path(options[:id]), options)
    end

    private

    def connection
      @connection ||= Connection.new(model: :video)
    end

    def path(id = nil)
      if id.nil?
        '/videos/closed_questions'
      else
        "/videos/closed_questions/#{id}"
      end
    end
  end
end
