class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_user
    if !current_user
      flash[:error] = "Please log in."
      redirect_to sign_in_path unless current_user
    end
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
