require 'test_helper'

module Datawow
  class TextCategoriesTest < TestBase
    def test_all
      stub_request(:get, TEXT_CATEGORY_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_categories), status: 200)
      response = TextCategory.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, TEXT_CATEGORY_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(text_categories), status: 200)
      response = TextCategory.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      mock_id = '1'
      stub_request(:get, TEXT_CATEGORY_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(text_category), status: 200)
      response = TextCategory.new.find_by(options.merge(id: mock_id))
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end
  end
end
