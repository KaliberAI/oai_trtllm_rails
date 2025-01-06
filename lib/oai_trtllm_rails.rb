require "oai_trtllm_rails/version"
require "oai_trtllm_rails/engine"

module OaiTrtllmRails
  mattr_accessor :triton_url, :account_class
  @@triton_url = "localhost:8001"
  @@account_class = "User"

  def self.setup
    yield self
  end

  def self.triton_client
    @@triton_client ||= NvTriton::Client.new(triton_url: @@triton_url)
  end

  def self.account_class
    @@account_class.constantize
  end
end
