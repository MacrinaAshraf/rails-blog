class UsersController < ApplicationController
  def signup
    p params
    @user = User.create(name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.persisted?
      session[:id] = @user.id
      redirect_to :root
    else
      render :register
    end
  end

  def register
    @user = User.new
  end

  def signin
    @user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    if @user
      session[:id] = @user.id
      redirect_to :root
    else
      @user = User.new
      render :login
    end
  end

  def login
    @user = User.new
  end

  def signout
    session[:id] = nil
    redirect_to :login
  end

end
