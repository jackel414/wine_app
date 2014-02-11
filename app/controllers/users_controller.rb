class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_filter :require_login, only: [:new, :create, :show]
  after_action :auto_register_email, only: [:create]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  #GET /users/new
  def new
	@user = User.new
  end

  def show
  end
  
  def edit
  end
  
  def user_list
	@users = User.all
  end
  
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def set_user
	  @user = User.find(params[:id])
	end
	
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
	end
    
	def auto_register_email
	  RegistrationMailer.registration_email(self).deliver
	end
	  
end
