# frozen_string_literal: true

module Datawow
  # :nodoc:
  class NanameueHuman
    include Datawow::Models::Interface

    attr_writer :token

    def initialize(token = nil)
      @token = token
      @type = :image
      @path = 'jobs/nanameue/consensuses'
    end
  end
end
