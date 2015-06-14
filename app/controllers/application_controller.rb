class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_admin?
  before_action :current_user?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?
    redirect_to rewards_path, notice: "Login or Sign up to get these great rewards!" unless logged_in?
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
