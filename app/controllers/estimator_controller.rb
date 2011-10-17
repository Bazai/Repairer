# encoding: utf-8
class EstimatorController < ApplicationController
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
      @car_models = @brand.car_models.ordered
    end

    if !params[:car_model_id].blank?
      @car_model = CarModel.find(params[:car_model_id], :order => :name)
      @production_years = @car_model.production_years.ordered
    end

    if !params[:production_year_id].blank?
      @production_year = ProductionYear.find(params[:production_year_id])
    end
   
    
  end
  
  
  
  
  
  def index_old
    @brands = Brand.all
    @car_models = CarModel.all
    @issues = nil
    
    # Если ни одного значения селекта не было передано
    if (params[:brand].blank? || params[:brand][:id].empty?)
      
      # То покажем стандартный селект списока брэндов
      @brands_select_params = [:brand, :id, @brands, :id, :name, :prompt => "Выбирай брэнд"]
      
      # И если змодели машины не выбиралось
      if (params[:car_model].blank? || params[:car_model][:id].empty?)
        # То все селекты кроме Брэнд покажем отключенными
        @car_models_select_params = [:car_model, :id, @car_models, :id, :name, { :prompt => "Модель автомобиля" }, \
                                   { :disabled => "disabled" }]
        @production_years_select_params = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" }]
      end
    # Был выбран селект Брэнда
    else
      # То покажем селект брэнда с заранее выбранным значением из полученных параметров формы
      @brands_select_params = [:brand, :id, @brands, :id, :name, { :selected => params[:brand][:id] } ]
      # Если модель машины не выбиралась, либо выбрали стандартное значение приглашения
      if (params[:car_model].blank? || params[:car_model][:id].empty?)
        #То покажем только модели для выбранного брэнда и приглашение "А вот сейчас выбирай модель"
        @car_models_select_params = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :prompt => "А вот сейчас выбирай модель" } ]
        #Но год выпуска по прежнему отключенный
        @production_years_select_params = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" } ]
      # Была выбрана модель машины
      else
        # Устанавлеваем модель машины полученной из параметров формы
        @car_models_select_params = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :selected => params[:car_model][:id] } ]
        # Если год выпуска не был выбран или выбрано приглашение года выпуска
        if (params[:production_year].blank? || params[:production_year][:id].empty?)
          # Покажем возможные годы выпуска для выбранной модели
          @production_years_select_params = [:production_year, :id, CarModel.find(params[:car_model][:id]).production_years, :id, :year, \
                                            { :prompt => "Можно выбрать год выпуска" } ]
        else
          # Покажем выбранным год выпуска, полученный из параметров формы
          @production_years_select_params = [:production_year, :id, CarModel.find(params[:car_model][:id]).production_years, :id, :year, \
                                            { :selected => params[:production_year][:id] } ]
          # До кучи передадим все найденные issues
          @issues = ProductionYear.find(params[:production_year][:id]).issues
        end
      end
    end
  end
  
  def good_params
    if (params[:brand].blank? || params[:brand][:id].empty?)
      @brands_selected = nil
      @brands_disabled = false
      @brands_select_params = [:brand, :id, @brands, :id, :name, :prompt => "Выбирай брэнд"]

      if (params[:car_model].blank? || params[:car_model][:id].empty?)
        @car_models_select_params = [:car_model, :id, @car_models, :id, :name, { :prompt => "Модель автомобиля" }, \
                                   { :disabled => "disabled" }]
        @production_years_select_params = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" }]
      end
    else
      @brands_select_params = [:brand, :id, @brands, :id, :name, { :selected => params[:brand][:id] } ]
      if (params[:car_model].blank? || params[:car_model][:id].empty?)
        @car_models_select_params = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :prompt => "А вот сейчас выбирай модель" } ]
        @production_years_select_params = [:production_year, :id, @car_models, :id, :name, { :prompt => "Год выпуска" }, \
                                         { :disabled => "disabled" } ]
      else
        @car_models_select_params = [:car_model, :id, Brand.find(params[:brand][:id]).car_models, :id, :name, \
                                   { :selected => params[:car_model][:id] } ] unless params[:car_model][:id].empty?
        @production_years_select_params = [:production_year, :id, CarModel.find(params[:car_model][:id]).production_years, :id, :year, \
                                         { :prompt => "Можно выбрать год выпуска" } ] unless params[:car_model][:id].empty?
      end
    end
  end
end
