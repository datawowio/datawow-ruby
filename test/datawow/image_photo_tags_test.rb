require 'test_helper'

module Datawow
  class ImagePhotoTagsTest < TestBase
    def test_all
      stub_request(:get, IMAGE_PHOTO_TAGS)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = ImagePhotoTag.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_PHOTO_TAGS)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = ImagePhotoTag.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_PHOTO_TAG)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tag), status: 200)
      response = ImagePhotoTag.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
