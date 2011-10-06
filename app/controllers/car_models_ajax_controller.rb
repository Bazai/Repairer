class CarModelsAjaxController < ApplicationController

  def get_car_models
    @car_models = CarModel.find_all_by_brand_id(@brand.id, :order => "name")
  end

  def new
    @car_model = CarModel.new
  end

  def edit
    @car_model = CarModel.find(params[:car_model_id])
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.new(params[:car_model])
    @car_model.brand = @brand

    @car_model.save!
    get_car_models()
  end

  def update
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.update_attributes!(params[:car_model])
  end

  def destroy
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.delete
    get_car_models()
  end

end
