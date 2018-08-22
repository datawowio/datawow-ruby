require 'test_helper'

module Datawow
  class TextClosedQuestionsTest < TestBase
    def test_all
      stub_request(:get, TEXT_CLOSED_QUESTION_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_conversations), status: 200)
      response = TextClosedQuestion.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, TEXT_CLOSED_QUESTION_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(text_conversations), status: 200)
      response = TextClosedQuestion.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      mock_id = '1'
      stub_request(:get, TEXT_CLOSED_QUESTION_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_conversation), status: 200)
      response = TextClosedQuestion.new.find_by(options.merge(id: mock_id))
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
