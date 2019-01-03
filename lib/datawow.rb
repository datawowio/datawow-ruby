# frozen_string_literal: true
require 'pry-byebug'

require_relative 'datawow/client_response'
require_relative 'datawow/connection'
require_relative 'datawow/connector'
require_relative 'datawow/error'
require_relative 'datawow/version'
require_relative 'datawow/models/interface'

require_relative 'datawow/models/images/image_closed_questions'
require_relative 'datawow/models/images/image_photo_tags'
require_relative 'datawow/models/images/image_choices'
require_relative 'datawow/models/images/image_messages'
require_relative 'datawow/models/images/nanameue_human'
require_relative 'datawow/models/predictions/predictors'

require_relative 'datawow/models/texts/text_categories'
require_relative 'datawow/models/texts/text_closed_questions'
require_relative 'datawow/models/texts/text_conversations'

require_relative 'datawow/models/videos/video_classifications'

# :nodoc:
module Datawow
  extend self

  attr_accessor :project_key

  class << self
    def setup
      yield self
    end

    def video_classification
      VideoClassification.new
    end

    def text_closed_question
      TextClosedQuestion.new
    end

    def text_category
      TextCategory.new
    end

    def text_conversation
      TextConversation.new
    end

    def image_closed_question
      ImageClosedQuestion.new
    end

    def image_photo_tag
      ImagePhotoTag.new
    end

    def image_choice
      ImageChoice.new
    end

    def image_message
      ImageMessage.new
    end

    def prediction
      Predictor.new
    end

    def nanameue_human
      NanameueHuman.new
    end
  end
end
