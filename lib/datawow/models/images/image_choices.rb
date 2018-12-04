# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageChoice
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :image
    end

    private

    def path
      '/images/choices'
    end
  end
end
