module Datawow
  # :nodoc:
  class ImagePhotoTag
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/images/photo_tags', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/images/photo_tags', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/images/photo_tag', options)
    end

    private

    def connection
      @connection ||= Connection.new('image')
    end
  end
end
