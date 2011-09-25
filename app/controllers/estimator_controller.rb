class EstimatorController < ApplicationController
  def index
    @brands = Brand.all
    @car_models = CarModel.all
  end
end
