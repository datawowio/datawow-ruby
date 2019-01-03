# frozen_string_literal: true

require 'test_helper'

module Datawow
  class ImageChoiceTest < TestBase
    def test_all
      stub_request(:get, IMAGE_CHOICES_URL)
        .to_return(body: JSON.generate(image_choices), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CHOICES_URL)
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{IMAGE_CHOICES_URL}?id=test")
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = model.find_by(id: 'test')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= ImageChoice.new
      @model.project_key = 'test'
      @model
    end
  end
end
