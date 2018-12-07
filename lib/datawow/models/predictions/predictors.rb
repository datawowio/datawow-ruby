# frozen_string_literal: true

module Datawow
  # :nodoc:
  class Predictor
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :ai
      @query_str = false
    end

    private

    def path
      'prime/predictions'
    end
  end
end
