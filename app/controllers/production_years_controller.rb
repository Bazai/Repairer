class ProductionYearsController < ApplicationController
  layout 'admin'
  # GET /production_years
  # GET /production_years.json
  def index
    @production_years = ProductionYear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_years }
    end
  end

  # GET /production_years/1
  # GET /production_years/1.json
  def show
    @production_year = ProductionYear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_year }
    end
  end

  # GET /production_years/new
  # GET /production_years/new.json
  def new
    @production_year = ProductionYear.new
    @brand = Brand.all
    @car_model = CarModel.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_year }
    end
  end

  # GET /production_years/1/edit
  def edit
    @production_year = ProductionYear.find(params[:id])
    @car_model = @production_year.car_model
  end

  # POST /production_years
  # POST /production_years.json
  def create
    @production_year = ProductionYear.new(params[:production_year])

    respond_to do |format|
      if @production_year.save
        format.html { redirect_to @production_year, notice: 'Production year was successfully created.' }
        format.json { render json: @production_year, status: :created, location: @production_year }
      else
        format.html { render action: "new" }
        format.json { render json: @production_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_years/1
  # PUT /production_years/1.json
  def update
    @production_year = ProductionYear.find(params[:id])

    respond_to do |format|
      if @production_year.update_attributes(params[:production_year])
        format.html { redirect_to @production_year, notice: 'Production year was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_years/1
  # DELETE /production_years/1.json
  def destroy
    @production_year = ProductionYear.find(params[:id])
    @production_year.destroy

    respond_to do |format|
      format.html { redirect_to production_years_url }
      format.json { head :ok }
    end
  end
end
