class CountriesController < ApplicationController
  before_action :set_country, only: [:edit, :update, :destroy]
  before_action :check_admin
  
  def index
    @countries = Country.all.order(:name)
  end
  
  def new
    @country = Country.new
  end
  
  def edit
  end
  
  def create
    @country = Country.new(country_params)
    
    respond_to do |format|
      if @country.save
        format.html { redirect_to countries_path, notice: 'Country successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to countries_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_path }
    end
  end
  
  private
  
  def set_country
    @country = Country.find(params[:id])
  end
  
  def country_params
    params.require(:country).permit(:name)
  end
  
  def check_admin
    if session[:user_role] != "Admin"
      redirect_to home_path
    end
  end
  
end