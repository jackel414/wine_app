class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy, :catalog]

  def error
  end
  
  def index
  end

  # GET /wines
  def cellar
  	if params[:status] == "cellared"
      if params[:sort]
        @wines = Wine.where(user_id: current_user.id, stored: true).order(params[:sort])
      else
  		  @wines = Wine.where(user_id: current_user.id, stored: true).order(:name)
      end
  	elsif params[:status] == "cataloged"
      if params[:sort]
        @wines = Wine.where(user_id: current_user.id, catalog: true).order(params[:sort])
      else
  		  @wines = Wine.where(user_id: current_user.id, catalog: true).order(:name)
      end
  	else
      if params[:sort]
        @wines = Wine.where(user_id: current_user.id).order(params[:sort])
      else
  		  @wines = Wine.where(user_id: current_user.id).order(:name)
      end
  	end

  end
  
  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    @wine.num_bottles = 1
  end

  # GET /wines/1/edit
  def edit
  end
  
  def wine_form_autocomplete_list
    if params[:model] == 'country'
      @list_items = Country.where("name ILIKE ?", "#{params[:term]}%")
    elsif params[:model] == 'province'
      @list_items = Province.where("name ILIKE ?", "#{params[:term]}%")
    elsif params[:model] == 'region'
      @list_items = Region.where("name ILIKE ?", "#{params[:term]}%")
    elsif params[:model] == 'grape'
      @list_items = Grape.where("name ILIKE ?", "#{params[:term]}%")
    end

    respond_to do |format|
      format.json
    end
  end
  
  # PUT /wines/catalog/1
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
      @wine.catalog_date = Time.now
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
      params.require(:wine).permit(:name, :grapes, :country, :province, :region, :stored, :winery, :vintage, :location, :wine_type, :price, :catalog, :purchase_date, :drink_date, :with_meal, :meal, :notes, :rating, :num_bottles, :abv, :user_id, :catalog_date)
    end

end
