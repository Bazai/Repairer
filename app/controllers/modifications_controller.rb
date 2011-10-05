class ModificationsController < ApplicationController
  respond_to :js
  before_filter :get_brands
  #after_filter :get_brands, :only => [:add_brand, :save_brand, :remove_brand]

  def get_brands
    @brands = Brand.all(:order => "created_at desc")
  end

  def get_car_models
    @car_models = CarModel.find_all_by_brand_id(@brand.id)
  end

  def index
    @brand = Brand.new
    @car_model = CarModel.new
    @car_models = []

  end



  def new_brand
    @brand = Brand.new
  end

  def edit_brand
    @brand = Brand.find(params[:id])
    @car_models = @brand.car_models
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
  end


  def new_car_model
    @car_model = CarModel.new
  end

  def edit_car_model
    @brand = Brand.find(params[:brand_id])
    @car_models = @brand.car_models
    @car_model = CarModel.find(params[:car_model_id])
  end

  def add_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.new(params[:car_model])
    @car_model.brand = @brand

    @car_model.save!
    get_car_models()
  end

  def save_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.update_attributes!(params[:car_model])
    get_car_models()
  end

  def remove_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.delete
    get_car_models()
  end

end
