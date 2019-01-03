# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextClosedQuestion
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :text
      @path = 'text/text_closed_questions'
    end
  end
end
