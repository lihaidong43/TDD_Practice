

class SessionsController < ApplicationController
  skip_before_filter :authenticate ,:only => [:new,:login]


  def new
    if session[:user_id]
      flash[:notice] = "you have already login in"
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user and user.password.eql? params[:user][:password]
      session[:user_id] = user.id
      flash[:notice] = "Login successfully"
      redirect_to session[:next_url] || users_path
    else
      flash[:notice] = "User #{params[:user][:email]} does not exist! or password was wrong!"
      redirect_to new_sessions_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def reset
    @user = User.find(session[:user_id])
    if @user.update_column(:password,params[:user][:password])
      flash[:notice] = "User #{@user.email}'s password already reset"
      redirect_to users_path
    else
      redirect_to edit_sessions_path
    end
  end



end

