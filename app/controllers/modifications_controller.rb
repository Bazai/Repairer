class ModificationsController < ApplicationController
  respond_to :js
  before_filter :get_brands
  #after_filter :get_brands

  def get_brands
    @brands = Brand.all(:order => "created_at desc")
  end

  def index
    @brand = Brand.new
  end

  def add_brand
    @brand = Brand.new(params[:brand])

    @brand.save!

    get_brands()
    respond_with @brand
  end

  def remove_brand
    @brand = Brand.find(params[:brand_id])

    @brand.delete
    get_brands()
  end

  def edit_brand
    @brand = Brand.find(params[:brand_id])

    respond_with @brand
  end

  def update_brand
    @brand = Brand.find(params[:brand][:id])

    @brand.update_attributes!(:name => params[:brand][:name])
    get_brands()
  end


  def clear_brand_form
    @brand = Brand.new
  end

end
