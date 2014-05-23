class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy, :catalog]
  before_action :other_options, only: [:update]

  def error
  end
  
  # GET /wines
  # GET /wines.json
  def index
	@wines = Wine.all
  end

  # GET /wines
  def cellar
	if params[:status] == "cellared"
		@wines = Wine.where(user_id: current_user.id, stored: true)
	elsif params[:status] == "cataloged"
		@wines = Wine.where(user_id: current_user.id, catalog: true)
	else
		@wines = Wine.where(user_id: current_user.id)
	end
  end
  
  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
    if Region.where(country: @wine.country).size == 0
      @wine.country_other = @wine.country
      @wine.country = 'Other'
    end

    if @wine.general_region
      if Region.where(general_region: @wine.general_region).size == 0
        @wine.general_region_other = @wine.general_region
        @wine.general_region = 'Other'
      end
    end

    if @wine.specific_region
      if Region.where(specific_region: @wine.specific_region).size == 0
        @wine.specific_region_other = @wine.specific_region
        @wine.specific_region = 'Other'
      end
    end

    if @wine.micro_region
      if Region.where(micro_region: @wine.micro_region).size == 0
        @wine.micro_region_other = @wine.micro_region
        @wine.micro_region = 'Other'
      end
    end
  end
  
  # POST /wines/catalog/1
  def catalog
    current_bottles = @wine.num_bottles
    bottles_left = nil
    in_cellar = true
    
    if current_bottles == 0
      bottles_left = 0
    else
      bottles_left = current_bottles - 1
    end
    
    if bottles_left == 0
      in_cellar = false
    end
    
    @wine.update(:catalog => true, :num_bottles => bottles_left, :stored => in_cellar, :catalog_date => Time.now)
    redirect_to edit_wine_path(@wine)
  end
  
  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)
	  @wine.user_id = current_user.id
    if @wine.catalog == true
      @wine.cataloged_date = Time.now
    end
    
    if @wine.country == 'Other'
      @wine.country = @wine.country_other
    end
    
    if @wine.general_region == 'Other'
      @wine.general_region = @wine.general_region_other
    end
    
    if @wine.specific_region == 'Other'
      @wine.specific_region = @wine.specific_region_other
    end
    
    if @wine.micro_region == 'Other'
      @wine.micro_region = @wine.micro_region_other
    end

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        if @wine.num_bottles == 0
          @wine.update(:stored => false)
        elsif @wine.stored == false
          @wine.update(:num_bottles => 0)
        end
                
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render json: @wine.errors, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:name, :grapes, :country, :country_other, :general_region, :general_region_other, :specific_region, :specific_region_other, :micro_region, :micro_region_other, :stored, :winery, :vintage, :location, :wine_type, :price, :catalog, :purchase_date, :drink_date, :with_meal, :meal, :notes, :rating, :num_bottles, :abv, :user_id, :catalog_date)
    end

    def other_options
    end
end
