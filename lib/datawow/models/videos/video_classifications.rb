# frozen_string_literal: true

module Datawow
  # :nodoc:
  class VideoClassification
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :text
    end

    private

    def path
      'videos/closed_questions'
    end
  end
end
