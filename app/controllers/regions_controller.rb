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
    if params[:country]
      @region = Region.uniq.where(country: params[:country]).where.not(general_region: '').order(:general_region)
      @field = :general_region
    elsif params[:general_region]
      @region = Region.uniq.where(general_region: params[:general_region]).where.not(specific_region: '').order(:specific_region)
      @field = :specific_region
    elsif params[:specific_region]
      @region = Region.uniq.where(specific_region: params[:specific_region]).where.not(micro_region: '').order(:micro_region)
      @field = :micro_region
    end
      
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