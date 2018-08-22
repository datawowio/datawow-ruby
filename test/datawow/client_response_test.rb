# frozen_string_literal: true

require 'test_helper'

module Datawow
  class ResponseTest < Minitest::Test
    def test_new_success_response
      response = Response.new('response', 200, 'success', 'meta', 5)
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(true, response.successful?)
      assert_equal('response', response.data)
      assert_equal('success', response.message)
      assert_equal('meta', response.meta)
      assert_equal(5, response.total)
    end

    def test_failure_response
      response = Response.new('response', 500, 'failure', 'meta')
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(false, response.successful?)
      assert_equal('response', response.data)
      assert_equal('failure', response.message)
      assert_equal('meta', response.meta)
      assert_equal(0, response.total)
    end
  end
end
