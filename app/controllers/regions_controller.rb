class RegionsController < ApplicationController
  before_action :set_region, only: [:edit, :update]
  before_action :check_admin
  
  def index
    @regions = Region.all
  end
  
  def new
    @region = Region.new
  end
  
  def edit
  end
  
  def region_dropdown
    @general_region = Region.uniq.where(country: params[:country]).where.not(general_region: '').order(:general_region)
    #@general_region = Region.uniq.where(country: params[:country]).order('general_region asc').pluck(:general_region)
    respond_to do |format|
      format.json
    end
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
    params.require(:region).permit(:country, :general_region, :specific_region, :micro_region)
  end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end