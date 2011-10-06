class ProductionYearsAjaxController < ApplicationController

  def get_production_years
    @production_years = ProductionYear.find_all_by_car_model_id(@car_model.id, :order => "year")
  end


  def new
    @production_year = ProductionYear.new
  end

  def edit
    @production_year = ProductionYear.find(params[:production_year_id])
  end

  def create
    @car_model = CarModel.find(params[:car_model_id])
    @production_year = ProductionYear.new(params[:production_year])
    @production_year.car_model = @car_model

    @production_year.save!
    get_production_years()
  end

  def update
    @production_year = ProductionYear.find(params[:production_year_id])

    @production_year.update_attributes!(params[:production_year])
  end

  def destroy
    @car_model = CarModel.find(params[:car_model_id])
    @production_year = ProductionYear.find(params[:production_year_id])

    @production_year.destroy
    get_production_years()
  end

end
