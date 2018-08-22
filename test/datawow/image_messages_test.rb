require 'test_helper'

module Datawow
  class ImageMessageTest < TestBase
    def test_all
      stub_request(:get, IMAGE_MESSAGES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_messages), status: 200)
      response = ImageMessage.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_MESSAGES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = ImageMessage.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_MESSAGE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = ImageMessage.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
