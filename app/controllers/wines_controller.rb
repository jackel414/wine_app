class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :drink, :update, :destroy]

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
  end
  
  # GET /wines/drink/1
  def drink
	@wine.update_attributes(:stored => false)
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)
	@wine.user_id = current_user.id

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
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
      params.require(:wine).permit(:name, :grapes, :region, :country, :stored, :sub_region, :winery, :vintage, :location, :wine_type, :price, :catalog, :purchase_date, :drink_date, :with_meal, :meal, :notes, :rating, :num_bottles, :abv, :user_id)
    end
end
