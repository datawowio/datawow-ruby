# frozen_string_literal: true

require 'test_helper'

module Datawow
  class ConnectorTest < Minitest::Test
    def test_get_success
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: 'foo', meta: { message: 'success', code: 200 }), status: 200)
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('200', response.status)
      assert_equal('success', response.message)
      assert_equal('success', response.meta['message'])
    end

    def test_get_failed
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: '', meta: { message: 'Internal Server Error', code: 500 }), status: 500)
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end

    def test_post_success
      stub_request(:post, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: 'foo', meta: { code: 200 }), status: 200)
      response = connector.post
      assert_instance_of(Response, response)
      assert_equal('200', response.status)
    end

    def test_post_failed
      stub_request(:post, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: '', meta: { code: 500, message: 'Internal Server Error' }), status: 500)
      response = connector.post
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end

    def test_bad_request_status
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(status: 400, body: JSON.generate(data: '', meta: { message: 'bad request', code: 400 }))
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('400', response.status)
    end

    def test_forbidden_status
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: '', meta: { message: 'forbidden', code: 403 }), status: 403)
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('403', response.status)
    end

    def test_not_found_status
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: '', meta: { message: 'not found', code: 404 }), status: 404)
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('404', response.status)
    end

    def test_edge_case_error
      stub_request(:get, 'https://kiyo-image.datawow.io/api/v1/images')
        .to_return(body: JSON.generate(data: '', meta: { message: 'version not supported', code: 505 }), status: 505)
      response = connector.get
      assert_instance_of(Response, response)
      assert_equal('505', response.status)
    end

    private

    def connector
      connector ||= Connector.new('images', :image, token: 'test')
    end
  end
end
