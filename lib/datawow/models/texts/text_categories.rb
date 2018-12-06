# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextCategory
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :text
    end

    private

    def path
      '/text/text_categories'
    end
  end
end
