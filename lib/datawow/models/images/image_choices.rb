# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageChoice
    include Datawow::Models::Interface

    attr_writer :token

    def initialize
      @token = nil
      @type = :image
      @path = 'images/choices'
    end
  end
end
