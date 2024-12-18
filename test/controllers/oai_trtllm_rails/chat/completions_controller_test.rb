require 'test_helper'

module OaiTrtllmRails::Chat
  class CompletionsControllerTest < ActionDispatch::IntegrationTest
    include OaiTrtllmRails::Engine.routes.url_helpers

    setup do
      @routes = OaiTrtllmRails::Engine.routes
    end

    def test_chat_completions
      mock = Minitest::Mock.new
      def mock.chat(model_name:, input:, model_params:); "The Chicago Cubs"; end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}]}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end
    end

    def test_chat_default_params
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}]}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_frequency_penalty_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], frequency_penalty: -2.0}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_max_tokens_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({max_tokens: 50}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], max_tokens: 50}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_presence_penalty_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({presence_penalty: -2.0}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], presence_penalty: -2.0}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_stop_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({stop_words: ["curse"]}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], stop: ["curse"]}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_n_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({beam_width: 2}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], n: 2}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_temperature_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({temperature: 0.5}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], temperature: 0.5}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end

    def test_chat_top_p_param
      mock = Minitest::Mock.new
      mock.expect :chat, "The Chicago Cubs" do |model_name:, input:, model_params:|
        model_name == "llama-3.1-8B-instruct" &&
          input == "who won the 2016 world series?" &&
          NvTriton::ModelParams.new({top_p: 0.5}) == model_params
      end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: [{ role: "user", content: "who won the 2016 world series?"}], top_p: 0.5}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end

      mock.verify
    end
  end
end
