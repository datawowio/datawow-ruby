# frozen_string_literal: true
require 'test_helper'

module Datawow
  class NanameueHumanTest < TestBase
    def test_all
      stub_request(:get, NANAMEUE_HUMAN_URL)
        .to_return(body: JSON.generate(nanameue_humen), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, NANAMEUE_HUMAN_URL)
        .to_return(body: JSON.generate(nanameue_human), status: 201)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(201, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{NANAMEUE_HUMAN_URL}?id=test")
        .to_return(body: JSON.generate(nanameue_human), status: 200)
      response = model.find_by(id: 'test')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= NanameueHuman.new
      @model.token = 'test'
      @model
    end
  end
end
