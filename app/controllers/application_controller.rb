class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  protected
  def authenticate
    begin
      store_location
      redirect_to new_sessions_path
    end unless session[:user_id]
  end

  private
  def store_location
    session[:next_url] = request.path
  end
end
