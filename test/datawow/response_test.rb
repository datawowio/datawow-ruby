# frozen_string_literal: true

require 'test_helper'

module Datawow
  class ResponseTest < Minitest::Test
    def test_new_success_response
      response_body = {
        'data' => 'anything',
        'code' => 200,
        'meta' => {
          'message' => 'success',
          'total_count' => 1
        }
      }

      response = Response.new(response_body, response_body['code'])
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(true, response.successful?)
      assert_equal('anything', response.data)
      assert_equal('success', response.message)
      assert_equal({ 'message' => 'success', 'total_count' => 1 }, response.meta)
      assert_equal(1, response.total)
    end

    def test_failure_response
      response_body = {
        'data' => 'nothing',
        'code' => 500,
        'meta' => { 'message' => 'failure' }
      }

      response = Response.new(response_body, response_body['code'])
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(false, response.successful?)
      assert_equal('nothing', response.data)
      assert_equal('failure', response.message)
      assert_equal({ 'message' => 'failure' }, response.meta)
      assert_equal(0, response.total)
    end
  end
end
