# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextCategory
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :text
      @query_str ||= nil
      @path = 'text/text_categories'
    end
  end
end
