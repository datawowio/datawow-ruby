# frozen_string_literal: true

require 'test_helper'

module Datawow
  class ModerationTest < TestBase
    def test_all
      stub_request(:get, MODERATION_URL)
        .to_return(body: JSON.generate(@moderation_all), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, MODERATION_URL)
        .to_return(body: JSON.generate(@moderation_create), status: 201)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(201, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_by
      stub_request(:get, "#{MODERATION_URL}?id=test")
        .to_return(body: JSON.generate(@moderation_find_by), status: 200)
      response = model.find_by(id: 'test')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= Moderation.new('test')
    end
  end
end
