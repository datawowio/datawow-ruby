require 'test_helper'

module Datawow
  class ImageClosedQuestionTest < TestBase
    def test_all
      stub_request(:get, IMAGE_CLOSED_QUESTIONS_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_questions), status: 200)
      response = ImageClosedQuestion.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CLOSED_QUESTIONS_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = ImageClosedQuestion.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_CLOSED_QUESTION_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = ImageClosedQuestion.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
