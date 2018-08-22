require 'test_helper'

module Datawow
  class ImageChoiceTest < TestBase
    def test_all
      stub_request(:get, IMAGE_CHOICES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_choices), status: 200)
      response = ImageChoice.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CHOICES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = ImageChoice.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_CHOICE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = ImageChoice.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
