class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_default_response_format
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  private

  def set_default_response_format
    request.format = :json
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
