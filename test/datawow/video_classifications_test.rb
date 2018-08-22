require 'test_helper'

module Datawow
  class VideoClassificationsTest < TestBase
    def test_all
      stub_request(:get, VIDEO_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(videos), status: 200)
      response = VideoClassification.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, VIDEO_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(videos), status: 200)
      response = VideoClassification.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      mock_id = '1'
      stub_request(:get, VIDEO_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(video), status: 200)
      response = VideoClassification.new.find_by(options.merge(id: mock_id))
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
