# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :after_login

  private

  def logged_in?
    current_user.present?
  end

  def after_login(user)
    session[:user_id] = user.id
    redirect_to cookies.delete(:request_url) || root_path, notice: "Welcome, #{current_user.login} Guru"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login])
  end
end
