class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user
  
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private 

  def authenticate_user!
    redirect_to login_path, notice: 'You have to be logged in.' unless current_user
  end
end
