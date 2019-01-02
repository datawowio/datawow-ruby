# frozen_string_literal: true
require 'test_helper'

module Datawow
  class ImageClosedQuestionTest < TestBase
    def test_all
      stub_request(:get, IMAGE_CLOSED_QUESTIONS_URL)
        .to_return(body: JSON.generate(image_closed_questions), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CLOSED_QUESTIONS_URL)
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{IMAGE_CLOSED_QUESTIONS_URL}?id=test")
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = model.find_by(id: 'test')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= ImageClosedQuestion.new
      @model.token = 'test'
      @model
    end
  end
end
