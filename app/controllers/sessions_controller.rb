class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end
  
  def welcome
  	if session[:user_id] != nil
  	  redirect_to home_path
  	end
  end
  
  def create
  	user = User.authenticate(params[:username], params[:password])
  	if user
  	  session[:user_id] = user.id
      session[:user_role] = user.role
  	  redirect_to home_path
  	else
  	  flash.now.alert = "invalid username/password"
  	  render "new"
  	end
  end
	
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "you've been logged out"
  end
  
end
