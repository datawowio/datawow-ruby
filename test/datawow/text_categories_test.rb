# frozen_string_literal: true

require 'test_helper'

module Datawow
  class TextCategoriesTest < TestBase
    def test_all
      stub_request(:get, TEXT_CATEGORY_URL)
        .to_return(body: JSON.generate(text_categories), status: 200)
      response = model.all

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, TEXT_CATEGORY_URL)
        .to_return(body: JSON.generate(text_categories), status: 200)
      response = model.create(options)

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, "#{TEXT_CATEGORY_URL}?id=1")
        .to_return(body: JSON.generate(text_category), status: 200)
      response = model.find_by(id: '1')

      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def model
      @model ||= TextCategory.new
      @model.token = 'test'
      @model
    end
  end
end
