# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageClosedQuestion
    include Datawow::Interface

    attr_writer :token

    def initialize
      @token = nil
    end

    private

    def path(find = false)
      if find
        'images/closed_question'
      else
        'images/closed_questions'
      end
    end
  end
end
