# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextJa
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize(token = nil)
      @project_key = token
      @type = :text
      @query_str = false
      @path = 'text_ai/text_ja'
    end
  end
end
