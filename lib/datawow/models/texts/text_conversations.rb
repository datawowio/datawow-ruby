module Datawow
  # :nodoc:
  class TextConversation
    def all(options = {})
      options[:token] ||= Datawow.project_key
      connection.get('/api/v1/text/text_conversations', options)
    end

    def create(options = {})
      options[:token] ||= Datawow.project_key
      connection.post('/api/v1/text/text_conversations', options)
    end

    #  if endpoint is params you must set
    #  options[:path_param] = true
    def find_by(options = {})
      options[:token] ||= Datawow.project_key
      options[:path_param] = true
      connection.get("/api/v1/text/text_conversations/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('text')
    end
  end
end
