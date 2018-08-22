module Datawow
  # :nodoc:
  class ImageMessage
    def all(options = {})
      options[:token] ||= Datawow.project_key
      options[:per_page] ||= 20
      options[:page] ||= 1
      connection.get('/api/images/messages', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/images/messages', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get("/api/projects/images/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('image')
    end
  end
end
