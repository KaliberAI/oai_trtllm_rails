# frozen_string_literal: true

require 'active_model/serialization'
require 'securerandom'

module OaiTrtllmRails::Chat
  class Response
    include ActiveModel::Serializers::JSON

    attr_accessor :id, :object, :created, :model, :system_fingerprint, :choices, :usage

    def initialize(model_name:, model_output:)
      @id = "cmpl-#{SecureRandom.uuid}"
      @object = "text_completion"
      @created = Time.now.to_i
      @model = model_name
      @choices = [CompletionChoice.new(message: CompletionMessage.new(content: model_output))]
      @usage = { prompt_tokens: 0, completion_tokens: 0, total_tokens: 0 }
    end

    def attributes
      {'id' => id, 'object' => object, 'created' => created, 'model' => model, 'choices' => choices, 'usage' => usage}
    end
  end
end
