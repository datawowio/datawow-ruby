# frozen_string_literal: true

require 'test_helper'

module Datawow
  class TextJaTest < TestBase
    def test_all
      stub_request(:get, TEXT_JA_URL)
        .to_return(body: JSON.generate(text_jas), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, TEXT_JA_URL)
        .to_return(body: JSON.generate(text_jas), status: 201)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(201, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{TEXT_JA_URL}/1")
        .to_return(body: JSON.generate(text_ja), status: 200)
      response = model.find_by(id: '1')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= TextJa.new
      @model.project_key = 'test'
      @model
    end
  end
end
