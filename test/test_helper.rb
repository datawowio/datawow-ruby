$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'

SimpleCov.start

require 'helper/file_reader'
require 'datawow'
require 'minitest/autorun'
require 'webmock/minitest'

class TestBase < Minitest::Test
  attr_reader :options, :image_choice, :image_choices, :image_closed_question,
              :image_closed_questions, :image_message, :image_messages, :image_photo_tag,
              :image_photo_tags, :prediction, :predictions, :videos, :video,
              :text_categories, :text_category, :text_conversations, :text_conversation,
              :text_closed_questions, :text_closed_question, :nanameue_human, :nanameue_humans,
              :text_ja, :text_jas, :image_document_verifications, :image_document_verification

  IMAGE_CHOICES_URL = 'https://image.datawow.io/api/v1/images/choices'.freeze
  IMAGE_CHOICE_URL = 'https://image.datawow.io/api/v1/images/choice'.freeze
  IMAGE_CLOSED_QUESTIONS_URL = 'https://image.datawow.io/api/v1/images/closed_questions'.freeze
  IMAGE_CLOSED_QUESTION_URL = 'https://image.datawow.io/api/v1/images/closed_question'.freeze
  IMAGE_MESSAGES_URL = 'https://image.datawow.io/api/v1/images/messages'.freeze
  IMAGE_MESSAGE_URL = 'https://image.datawow.io/api/v1/images/message'.freeze
  IMAGE_PHOTO_TAGS = 'https://image.datawow.io/api/v1/images/photo_tags'.freeze
  IMAGE_PHOTO_TAG = 'https://image.datawow.io/api/v1/images/photo_tag'.freeze
  IMAGE_DOCUMENT_VERIFICATION_URL = 'https://image.datawow.io/api/v1/images/document_verifications'.freeze
  PREDICTIONS_URL = 'https://image.datawow.io/api/v1/prime/predictions'.freeze
  IMAGE_URL = 'https://image.datawow.io/api/v1/projects/images'.freeze
  VIDEO_URL = 'https://image.datawow.io/api/v1/videos/closed_questions'.freeze
  NANAMEUE_HUMAN_URL = 'https://image.datawow.io/api/v1/jobs/nanameue/consensuses'.freeze
  TEXT_CATEGORY_URL = 'https://text.datawow.io/api/v1/text/text_categories'.freeze
  TEXT_CONVERSATION_URL = 'https://text.datawow.io/api/v1/text/text_conversations'.freeze
  TEXT_CLOSED_QUESTION_URL = 'https://text.datawow.io/api/v1/text/text_closed_questions'.freeze
  TEXT_JA_URL = 'https://text.datawow.io/api/v1/text_ai/text_ja'.freeze

  def setup
    @image_choices = FileReader.new('test/fixtures/image_choice/all.json').read_json
    @image_choice = FileReader.new('test/fixtures/image_choice/create.json').read_json
    @image_closed_questions = FileReader.new('test/fixtures/image_closed_question/all.json').read_json
    @image_closed_question = FileReader.new('test/fixtures/image_closed_question/create.json').read_json
    @image_messages = FileReader.new('test/fixtures/image_message/all.json').read_json
    @image_message = FileReader.new('test/fixtures/image_message/create.json').read_json
    @image_photo_tags = FileReader.new('test/fixtures/image_photo_tag/all.json').read_json
    @image_photo_tag = FileReader.new('test/fixtures/image_photo_tag/create.json').read_json
    @image_document_verifications = FileReader.new('test/fixtures/image_document_verification/all.json').read_json
    @image_document_verification = FileReader.new('test/fixtures/image_document_verification/create.json').read_json
    @predictions = FileReader.new('test/fixtures/prediction/all.json').read_json
    @prediction = FileReader.new('test/fixtures/prediction/create.json').read_json
    @videos = FileReader.new('test/fixtures/video_classification/all.json').read_json
    @video = FileReader.new('test/fixtures/video_classification/create.json').read_json
    @nanameue_human = FileReader.new('test/fixtures/nanameue_human/create.json').read_json
    @nanameue_humans = FileReader.new('test/fixtures/nanameue_human/all.json').read_json
    @text_category = FileReader.new('test/fixtures/text_category/create.json').read_json
    @text_categories = FileReader.new('test/fixtures/text_category/all.json').read_json
    @text_conversation = FileReader.new('test/fixtures/text_conversation/create.json').read_json
    @text_conversations = FileReader.new('test/fixtures/text_conversation/all.json').read_json
    @text_closed_question = FileReader.new('test/fixtures/text_closed_question/create.json').read_json
    @text_closed_questions = FileReader.new('test/fixtures/text_closed_question/all.json').read_json
    @text_ja = FileReader.new('test/fixtures/text_ja/create.json').read_json
    @text_jas = FileReader.new('test/fixtures/text_ja/all.json').read_json
    @options = {
      token: 'project token'
    }
  end
end
