# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :after_login

  private

  def authenticate_user!
    unless current_user
      cookies[:request_url] = request.url
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def after_login(user)
    session[:user_id] = user.id
    redirect_to cookies.delete(:request_url) || root_path, notice: "Welcome, #{current_user.login} Guru"
  end
end
