module Datawow
  # :nodoc:
  class TextClosedQuestion
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/v1/text/text_closed_questions', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/v1/text/text_closed_questions', options)
    end

    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      connection.get("/api/v1/text/text_closed_questions/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('text')
    end
  end
end
