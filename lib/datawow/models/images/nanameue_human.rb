# frozen_string_literal: true

module Datawow
  # :nodoc:
  class NanameueHuman
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize(token = nil)
      @project_key = token
      @type = :image
      @query_str ||= nil
      @path = 'jobs/nanameue/consensuses'
    end
  end
end
