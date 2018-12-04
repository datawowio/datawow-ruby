# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextConversation
    include Datawow::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :text
    end

    private

    def path
      '/text/text_conversations'
    end
  end
end
