# frozen_string_literal: true

require 'active_model/serialization'

module OaiTrtllmRails::Chat
  class CompletionChoice
    include ActiveModel::Serializers::JSON

    attr_accessor :index, :message, :finish_reason

    def initialize(message:)
      @index = 0
      @message = message
      @finish_reason = 'stop'
    end

    def attributes
      {'index' => index, 'message' => message, 'finish_reason' => finish_reason }
    end
  end
end
