$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'

SimpleCov.start

require 'helper/file_reader'
require 'datawow'
require 'minitest/autorun'
require 'webmock/minitest'

class TestBase < Minitest::Test
  attr_reader :options, :image_choice, :image_choices, :image_closed_question, :image_closed_questions,
              :image_message, :image_messages, :image_photo_tag, :image_photo_tags, :prediction, :predictions

  IMAGE_CHOICES_URL          = 'https://k-sequencing.datawow.io/api/images/choices'.freeze
  IMAGE_CHOICE_URL           = 'https://k-sequencing.datawow.io/api/images/choice'.freeze
  IMAGE_CLOSED_QUESTIONS_URL = 'https://k-sequencing.datawow.io/api/images/closed_questions'.freeze
  IMAGE_CLOSED_QUESTION_URL  = 'https://k-sequencing.datawow.io/api/images/closed_question'.freeze
  IMAGE_MESSAGES_URL         = 'https://k-sequencing.datawow.io/api/images/messages'.freeze
  IMAGE_MESSAGE_URL          = 'https://k-sequencing.datawow.io/api/images/message'.freeze
  IMAGE_PHOTO_TAGS           = 'https://k-sequencing.datawow.io/api/images/photo_tags'.freeze
  IMAGE_PHOTO_TAG            = 'https://k-sequencing.datawow.io/api/images/photo_tag'.freeze
  PREDICTIONS_URL            = 'https://k-sequencing.datawow.io/api/prime/predictions'.freeze
  IMAGE_URL                  = 'https://k-sequencing.datawow.io/api/projects/images'.freeze

  def setup
    @image_choices          = FileReader.new('test/fixtures/image_choice/all.json').read_json
    @image_choice           = FileReader.new('test/fixtures/image_choice/create.json').read_json
    @image_closed_questions = FileReader.new('test/fixtures/image_closed_question/all.json').read_json
    @image_closed_question  = FileReader.new('test/fixtures/image_closed_question/create.json').read_json
    @image_messages         = FileReader.new('test/fixtures/image_message/all.json').read_json
    @image_message          = FileReader.new('test/fixtures/image_message/create.json').read_json
    @image_photo_tags       = FileReader.new('test/fixtures/image_photo_tag/all.json').read_json
    @image_photo_tag        = FileReader.new('test/fixtures/image_photo_tag/create.json').read_json
    @predictions            = FileReader.new('test/fixtures/prediction/all.json').read_json
    @prediction             = FileReader.new('test/fixtures/prediction/create.json').read_json
    @options = {
      token: 'project token'
    }
  end
end
