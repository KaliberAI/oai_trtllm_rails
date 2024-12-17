require 'test_helper'

module OaiTrtllmRails::Chat
  class CompletionsControllerTest < ActionDispatch::IntegrationTest
    include OaiTrtllmRails::Engine.routes.url_helpers

    setup do
      @routes = OaiTrtllmRails::Engine.routes
    end

    def test_chat_completions
      mock = Minitest::Mock.new
      def mock.chat(model_name:, input:); "The Chicago Cubs"; end

      OaiTrtllmRails.stub :triton_client, mock do
        post chat_completions_url, params: {model: "llama-3.1-8B-instruct", messages: ["who won the 2016 world series?"]}
        assert_equal @response.parsed_body["choices"][0]["message"]["content"], "The Chicago Cubs"
      end
    end
  end
end
