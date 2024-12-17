# frozen_string_literal: true

module OaiTrtllmRails::Chat
  class OaiTritonParamConverter
    attr_accessor :frequency_penalty,
      :logit_bias,
      :max_tokens,
      :n,
      :presence_penalty,
      :response_format,
      :seed,
      :stop,
      :stream,
      :temperature,
      :top_p,
      :user

    def initialize(params = {})
      @frequency_penalty = params[:frequency_penalty]
      @logit_bias = params[:logit_bias]
      @max_tokens = params[:max_tokens]
      @n = params[:n]
      @presence_penalty = params[:presence_penalty]
      @response_format = params[:response_format]
      @seed = params[:seed]
      @stop = params[:stop]
      @stream = params[:stream]
      @temperature= params[:temperature]
      @top_p = params[:top_p]
      @user = params[:user]
    end

    def convert
      triton_params = {
        max_tokens: @max_tokens,
        stop_words: @stop,
        top_p: @top_p,
        temperature: @temperature,
        presence_penalty: @presence_penalty,
        beam_width: @n,
        stream: @stream,
      }

      if @seed
        triton_params.merge!({random_seed: @seed})
      end

      triton_params
    end
  end
end
