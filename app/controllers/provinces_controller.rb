class ProvincesController < ApplicationController
  before_action :set_province, only: [:edit, :update, :destroy]
  before_action :check_admin
  
  def index
    @provinces = Province.all.order(:name)
  end
  
  def new
    @province = Province.new
  end
  
  def edit
  end

  def create
    @province = Province.new(province_params)
    
    respond_to do |format|
      if @province.save
        format.html { redirect_to provinces_path, notice: 'Province successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to provinces_path, notice: 'Province was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @province.destroy
    respond_to do |format|
      format.html { redirect_to provinces_path }
    end
  end
  
  private
  
  def set_province
    @province = Province.find(params[:id])
  end
  
  def province_params
    params.require(:province).permit(:name, :country_id)
  end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end