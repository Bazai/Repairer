class BrandsAjaxController < ApplicationController

  def get_brands
    @brands = Brand.all(:order => "name")
  end


  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(params[:brand])

    @brand.save!
    get_brands()
  end

  def update
    @brand = Brand.find(params[:id])

    @brand.update_attributes!(params[:brand])
    get_brands()
  end

  def destroy
    @brand = Brand.find(params[:id])

    @brand.delete
    get_brands()
  end

end
