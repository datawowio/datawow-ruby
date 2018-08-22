module Datawow
  # :nodoc:
  class ImageChoice
    def all(options = {})
      options[:token] ||= Datawow.project_key
      options[:per_page] ||= 20
      options[:page] ||= 1
      connection.get('/api/images/choices', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/images/choices', options)
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
