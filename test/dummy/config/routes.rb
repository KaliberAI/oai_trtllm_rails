Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      mount OaiTrtllmRails::Engine => "/"
    end
  end
end
