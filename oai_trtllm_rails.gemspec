require_relative "lib/oai_trtllm_rails/version"

Gem::Specification.new do |spec|
  spec.name        = "oai_trtllm_rails"
  spec.version     = OaiTrtllmRails::VERSION
  spec.authors     = [ "Mason Stallmo" ]
  spec.email       = [ "mason@kaliber.ai" ]
  spec.homepage    = "https://github.com/kaliberai/oai_trtllm_rails"
  spec.summary     = "OpenAI compatible API connection to Triton TensorRT-LLM"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kaliberai/oai_trtllm_rails"
  spec.metadata["changelog_uri"] = "https://github.com/kaliberai/oai_trtllm_rails/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.1"
  spec.add_dependency "nv_triton"
end
