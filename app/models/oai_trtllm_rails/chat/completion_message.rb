# frozen_string_literal: true

require 'active_model/serialization'

module OaiTrtllmRails::Chat
  class CompletionMessage
    include ActiveModel::Serializers::JSON

    attr_accessor :role, :content

    def initialize(content:)
      @role = 'assistant'
      @content = content
    end

    def attributes
      { 'role' => role, 'content' => content }
    end
  end
end
