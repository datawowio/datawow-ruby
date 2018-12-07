# frozen_string_literal: true

module Datawow
  # :nodoc:
  class TextCategory
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :text
      @query_str = false
    end

    private

    def path
      'text/text_categories'
    end
  end
end
