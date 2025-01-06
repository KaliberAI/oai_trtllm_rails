# frozen_string_literal: true

module ApiAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    # helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def require_authentication
    header = request.headers["Authorization"]

    if header
      token = header.split(" ")[1]
      @user = OaiTrtllmRails.account_class.find_by_api_key(token)

      unless @user.present?
        render json: { message: "Login required" }, status: :unauthorized
      end
    else
      render json: { message: "Authorization header required" }, status: :bad_request
    end
  end

  def current_user
    @user
  end
end
