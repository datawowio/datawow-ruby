# frozen_string_literal: true

module Datawow
  # :nodoc:
  class Moderation
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize(token = nil)
      @project_key = token
      @type = :moderation
      @path = 'moderations'
    end
  end
end
