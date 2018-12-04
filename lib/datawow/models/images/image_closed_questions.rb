# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageClosedQuestion
    include Datawow::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :image
    end

    private

    def path
      'images/closed_questions'
    end
  end
end
