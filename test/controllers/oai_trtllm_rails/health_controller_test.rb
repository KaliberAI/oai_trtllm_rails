require 'test_helper'

module OaiTrtllmRails
  # Mocking `OaiTrtllmRails#triton_client` so we can run tests without
  # having a live gRPC server running.
  class HealthControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    def test_health_check_healthy
      mock = Minitest::Mock.new
      def mock.healthy?; true; end

      OaiTrtllmRails.stub :triton_client, mock do
        get triton_health_check_url
        assert_response :success
      end
    end

    def test_health_check_unhealthy
      mock = Minitest::Mock.new
      def mock.healthy?; false; end

      OaiTrtllmRails.stub :triton_client, mock do
        get triton_health_check_url
        assert_response :service_unavailable
      end
    end
  end
end
