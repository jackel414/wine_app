class RegionsController < ApplicationController
  before_action :set_region, only: [:edit, :update, :destroy]
  before_action :check_admin
  
  def index
    @regions = Region.all.order(:name)
  end
  
  def new
    @region = Region.new
  end
  
  def edit
  end
  
  def create
    @region = Region.new(region_params)
    
    respond_to do |format|
      if @region.save
        format.html { redirect_to regions_path, notice: 'Region successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to regions_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_path }
    end
  end
  
  private
  
  def set_region
    @region = Region.find(params[:id])
  end
  
  def region_params
    params.require(:region).permit(:name, :country_id, :province_id)
  end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end