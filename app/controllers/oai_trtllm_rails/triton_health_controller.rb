# frozen_string_literal: true

module OaiTrtllmRails
  class TritonHealthController < OaiTrtllmRails::ApplicationController
    allow_unauthenticated_access only: %i[ health_check ]

    def health_check
      if OaiTrtllmRails.triton_client.healthy?
        head :ok
      else
        head :service_unavailable
      end
    end
  end
end
