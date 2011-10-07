class EstimController < ApplicationController
  before_filter :get_all

  def index
  end

  def get_all
    @brands = Brand.all
    #@car_models = CarModel.all
    #@production_years = ProductionYear.all
  end

  def showselects

    if !params[:brand_id].blank?
      @brand = Brand.find(params[:brand_id], :order => :name)
      @car_models = @brand.car_models(:order => :name)
    end

    if !params[:car_model_id].blank?
      @car_model = CarModel.find(params[:car_model_id], :order => :name)
      @production_years = @car_model.production_years
    end

    if !params[:production_year_id].blank?
      @production_year = ProductionYear.find(params[:production_year_id])
    end

  end

end
