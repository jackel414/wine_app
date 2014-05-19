class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :deactivate, :activate, :destroy]
  before_action :check_admin, only: [:user_list, :index, :admin]
  skip_before_action :require_login, only: [:new, :create, :show, :inactive]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all.order('first_name asc')
  end
  
  #GET /users/new
  def new
	  @user = User.new
  end
  
  def home
    @user = User.find(session[:user_id])
    @recent_wines = @user.wines.order('updated_at desc').limit(5)
  end

  def show
  end
  
  def edit
  end
  
  def admin
  end
  
  def inactive
  end
    
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
	    RegistrationMailer.registration_email(@user).deliver
        format.html { redirect_to @user, notice: 'Your account has been successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #this needs to be combined with below method using Toggle
  def deactivate
	  @user.update(:active => false)
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def activate
	  @user.update(:active => true)
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  private
  def set_user
	  @user = User.find(params[:id])
    if @user.id != session[:user_id]
      if session[:user_role] != "Admin"
        redirect_to home_path
      end
    end
	end
	
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :role)
	end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end
