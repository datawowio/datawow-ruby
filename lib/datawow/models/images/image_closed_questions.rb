module Datawow
  # :nodoc:
  class ImageClosedQuestion
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/images/closed_questions', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/images/closed_questions', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/images/closed_question', options)
    end

    private

    def connection
      @connection ||= Connection.new('image')
    end
  end
end
