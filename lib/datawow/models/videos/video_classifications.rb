module Datawow
  # :nodoc:
  class VideoClassification
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/videos/closed_questions', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/videos/closed_questions', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get("/api/videos/closed_questions/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('video')
    end
  end
end
