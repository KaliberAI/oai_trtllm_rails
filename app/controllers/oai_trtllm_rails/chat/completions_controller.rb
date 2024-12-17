# frozen_string_literal: true

module OaiTrtllmRails::Chat
  class CompletionsController < ApplicationController
    def completion
      output = OaiTrtllmRails.triton_client.chat(
        model_name: completion_params[:model],
        input: completion_params[:messages][0]
      )

      response = Response.new(model_name: completion_params[:model], model_output: output)

      render json: response
    end

    private

    def completion_params
      params.permit(:model, messages: [])
    end
  end
end
