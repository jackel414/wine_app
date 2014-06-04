class GrapesController < ApplicationController
  before_action :set_grape, only: [:edit, :update]
  before_action :check_admin
  
  def index
    @grapes = Grape.all
  end
  
  def new
    @grape = Grape.new
  end
  
  def edit
  end
  
  def grapes_list
    @grapes = Grape.where("name ILIKE ?", "#{params[:term]}%")

    respond_to do |format|
      format.json
    end
  end

  def create
    @grape = Grape.new(grape_params)
    
    respond_to do |format|
      if @grape.save
        format.html { redirect_to grapes_path, notice: 'Grape successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @grape.update(grape_params)
        format.html { redirect_to grapes_path, notice: 'Grape was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @grape.destroy
    respond_to do |format|
      format.html { redirect_to grapes_path }
    end
  end
  
  private
  
  def set_grape
    @grape = Grape.find(params[:id])
  end
  
  def grape_params
    params.require(:grape).permit(:name)
  end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end