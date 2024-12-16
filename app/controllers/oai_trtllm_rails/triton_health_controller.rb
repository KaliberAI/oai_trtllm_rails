# frozen_string_literal: true

module OaiTrtllmRails
  class TritonHealthController < ApplicationController
    def health_check
      if OaiTrtllmRails.triton_client.healthy?
        head :ok
      else
        head :service_unavailable
      end
    end
  end
end
