# frozen_string_literal: true

module OaiTrtllmRails::Chat
  class CompletionsController < OaiTrtllmRails::ApplicationController
    def completion
      model_params = NvTriton::ModelParams.new(OaiTritonParamConverter.new(completion_params.to_h).convert)
      output = OaiTrtllmRails.triton_client.chat(
        model_name: completion_params[:model],
        input: completion_params[:messages][0][:content],
        model_params: model_params
      )

      response = Response.new(model_name: completion_params[:model], model_output: output)

      render json: response
    end

    private

    def completion_params
      params.permit(:model, :frequency_penalty, :max_tokens, :presence_penalty, :n, :temperature, :top_p, stop: [], messages: [:role, :content])
    end
  end
end
