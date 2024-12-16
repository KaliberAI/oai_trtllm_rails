OaiTrtllmRails::Engine.routes.draw do
  get "triton_health_check", to: "triton_health#health_check"
end
