class ModificationsController < ApplicationController
  respond_to :js
  before_filter :get_brands
  #after_filter :get_brands, :only => [:add_brand, :save_brand, :remove_brand]

  def get_brands
    @brands = Brand.all(:order => "created_at desc")
  end

  def get_car_models
    @car_models = CarModel.find_all_by_brand_id(@brand.id, :order => "created_at desc")
  end

  def get_production_years
    @production_years = ProductionYear.find_all_by_car_model_id(@car_model.id, :order => "created_at desc")
  end


  def index
    @brand = Brand.new
    @car_model = CarModel.new
    @car_models = []
    @production_year = ProductionYear.new
    @production_years = []
  end



  def new_brand
    @brand = Brand.new
    @car_model = CarModel.new
    @car_models = []
    @production_year = ProductionYear.new
    @production_years = []
  end

  def edit_brand
    @brand = Brand.find(params[:id])
    @car_models = @brand.car_models

    @car_model = CarModel.new
    @production_year = ProductionYear.new
    @production_years = []

  end

  def add_brand
    @brand = Brand.new(:name => params[:name])

    @brand.save!
    get_brands()
  end

  def save_brand
    @brand = Brand.find(params[:id])

    @brand.update_attributes!(:name => params[:name])
    get_brands()
  end

  def remove_brand
    @brand = Brand.find(params[:id])

    @brand.delete
    get_brands()

    @car_model = CarModel.new
    @car_models = []
    @production_year = ProductionYear.new
    @production_years = []
  end




  def new_car_model
    @car_model = CarModel.new

    @production_year = ProductionYear.new
    @production_years = []
  end

  def edit_car_model
    @brand = Brand.find(params[:brand_id])
    @car_models = @brand.car_models
    @car_model = CarModel.find(params[:car_model_id])
    @production_years = @car_model.production_years

    @production_year = ProductionYear.new

  end

  def add_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.new(params[:car_model])
    @car_model.brand = @brand

    @car_model.save!
    get_car_models()

    @production_year = ProductionYear.new
    @production_years = []
  end

  def save_car_model
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.update_attributes!(params[:car_model])
    get_car_models()
  end

  def remove_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.delete
    get_car_models()

    @production_year = ProductionYear.new
    @production_years = []
  end



  def new_production_year
    @production_year = ProductionYear.new
  end

  def edit_production_year
    @production_year = ProductionYear.find(params[:production_year_id])
  end

  def add_production_year
    @car_model = CarModel.find(params[:car_model_id])
    @production_year = ProductionYear.new(:year => params[:production_year][:year])
    @production_year.car_model = @car_model

    @production_year.save!
    get_production_years()
  end

  def save_production_year
    @production_year = ProductionYear.find(params[:production_year_id])
    @production_year.update_attributes!(params[:production_year])
  end

  def remove_production_year
    @car_model = CarModel.find(params[:car_model_id])
    @production_year = ProductionYear.find(params[:production_year_id])

    @production_year.delete
    get_production_years()
  end

end
