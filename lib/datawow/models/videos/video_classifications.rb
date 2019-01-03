# frozen_string_literal: true

module Datawow
  # :nodoc:
  class VideoClassification
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize
      @project_key = nil
      @type = :video
      @query_str = false
      @path = 'videos/closed_questions'
    end
  end
end
