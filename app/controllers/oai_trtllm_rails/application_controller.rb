module OaiTrtllmRails
  class ApplicationController < ActionController::Base
    rescue_from GRPC::Unavailable, with: :grpc_unavailable

    protected

    def grpc_unavailable
      head :service_unavailable
    end
  end
end
