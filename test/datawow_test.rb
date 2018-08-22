require 'test_helper'

module Datawow
  class DatawowTest < Minitest::Test
    def test_setup
      Datawow.setup { |config| }
    end

    def test_image_closed_question
      closed_question = Datawow.image_closed_question
      refute_nil(closed_question)
    end

    def test_image_photo_tag
      photo_tag = Datawow.image_photo_tag
      refute_nil(photo_tag)
    end

    def test_image_choice
      choice = Datawow.image_choice
      refute_nil(choice)
    end

    def test_image_message
      message = Datawow.image_message
      refute_nil(message)
    end

    def test_prediction
      prediction = Datawow.prediction
      refute_nil(prediction)
    end
  end
end
