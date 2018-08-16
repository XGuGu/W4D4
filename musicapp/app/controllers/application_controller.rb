class ApplicationController < ActionController::Base

  helper_method :current_user
  
  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_logged_in
    redirect_to bands_url if logged_in?
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end
end
