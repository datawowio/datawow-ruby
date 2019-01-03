# frozen_string_literal: true

module Datawow
  # :nodoc:
  class ImageMessage
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :image
      @path = 'images/messages'
    end
  end
end
