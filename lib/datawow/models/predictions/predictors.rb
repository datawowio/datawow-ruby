# frozen_string_literal: true

module Datawow
  # :nodoc:
  class Predictor
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :ai
      @query_str = false

      @path = 'prime/predictions'
    end
  end
end
