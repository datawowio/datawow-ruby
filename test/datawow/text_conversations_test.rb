require 'test_helper'

module Datawow
  class TextConversationsTest < TestBase
    def test_all
      stub_request(:get, TEXT_CONVERSATION_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_closed_questions), status: 200)
      response = TextConversation.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, TEXT_CONVERSATION_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(text_closed_questions), status: 200)
      response = TextConversation.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      mock_id = '1'
      stub_request(:get, TEXT_CONVERSATION_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_closed_question), status: 200)
      response = TextConversation.new.find_by(options.merge(id: mock_id))
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
