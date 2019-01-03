# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextConversation
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :text
      @path = 'text/text_conversations'
    end
  end
end
