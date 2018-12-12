# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextClosedQuestion
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :text
      @path = 'text/text_closed_questions'
    end
  end
end
