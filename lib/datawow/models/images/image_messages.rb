module Datawow
  # :nodoc:
  class ImageMessage
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get(path, options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post(path, options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get(path(true), options)
    end

    private

    def connection
      @connection ||= Connection.new(model: :image)
    end

    def path(find = false)
      if find
        '/images/message'
      else
        '/images/messages'
      end
    end
  end
end
