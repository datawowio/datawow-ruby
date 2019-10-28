# frozen_string_literal: true

module Datawow
  # :nodoc:
  class Tasker
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize(token = nil)
      @project_key = token
      @type = :tasker
      @query_str ||= nil

      @path = 'moderations'
    end
  end
end
