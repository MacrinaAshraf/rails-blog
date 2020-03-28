class ApplicationController < ActionController::Base
  before_action :auth, except: %i[login register signin signup]
  before_action :logged_in?, only: %i[login register signin signup]
  def auth
    redirect_to(:login) unless session[:id]
  end

  def logged_in?
    redirect_to(:posts) if session[:id]
  end

  def current_user
    @user = User.find(session[:id]) unless session[:id].nil?
  end
end
