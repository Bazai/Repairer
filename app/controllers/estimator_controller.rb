class EstimatorController < ApplicationController
  def index
    @brands = Brand.all
  end
end
