# encoding: utf-8
class EstimatorController < ApplicationController
  def index
    @brands = Brand.all
    @car_models = CarModel.all

    if (params[:brand].blank?)
      @brands_select_pars = [:brand, :id, @brands, :id, :name, :prompt => "Выбирай брэнд"]

      if params[:car_model].blank?
        @car_models_select_pars = [:car_model, :id, @car_models, :id, :name, { :prompt => "Модель автомобиля" }, \
                                   { :disabled => "disabled" }]
        @production_years_select_pars = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" }]
      end
    else
      @brands_select_pars = [:brand, :id, @brands, :id, :name, { :selected => params[:brand][:id] } ]
      if params[:car_model].blank?
        @car_models_select_pars = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :prompt => "А вот сейчас выбирай модель" } ]
        @production_years_select_pars = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" } ]
      else
        @car_models_select_pars = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :selected => params[:car_model][:id] } ] unless params[:car_model][:id].empty?
        @production_years_select_pars = [:production_year, :id, CarModel.find(params[:car_model][:id]).production_years, :id, :year, \
                                         { :prompt => "Можно выбрать год выпуска" } ] unless params[:car_model][:id].empty?
      end
    end
  end
end
