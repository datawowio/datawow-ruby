# frozen_string_literal: true

module Datawow
  # :nodoc:
  class DocumentVerification
    include Datawow::Models::Interface

    attr_writer :project_key

    def initialize(token = nil)
      @project_key = token
      @type = :image
      @query_str = false

      @path = 'images/document_verifications'
    end
  end
end
