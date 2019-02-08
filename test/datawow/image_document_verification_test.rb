# frozen_string_literal: true

require 'test_helper'

module Datawow
  class DocumentVerificationTest < TestBase
    def test_all
      stub_request(:get, IMAGE_DOCUMENT_VERIFICATION_URL)
        .to_return(body: JSON.generate(image_document_verifications), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_DOCUMENT_VERIFICATION_URL)
        .to_return(body: JSON.generate(image_document_verification), status: 201)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(201, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{IMAGE_DOCUMENT_VERIFICATION_URL}/test")
        .to_return(body: JSON.generate(image_document_verification), status: 200)
      response = model.find_by(id: 'test')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= DocumentVerification.new
      @model.project_key = 'test'
      @model
    end
  end
end
