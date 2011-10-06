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

  def get_maintenances
    @maintenances = Maintenance.find_all_by_production_year_id(@production_year.id, :order => "created_at desc")
  end

  def clear
    all = ["car_model", "production_year", "maintenance"]

    from = params[:from]

    if from == "brand"
      @clear = all

      @car_model = CarModel.new
      @car_models = []
      @production_year = ProductionYear.new
      @production_years = []
      @maintenance = Maintenance.new
      @maintenances = []

      if !params[:edit].blank?
        @brand = Brand.find(params[:edit])
        @car_models = @brand.car_models
      end

    end

    if from == "car_model"
      @clear = all.last(2)

      @car_model = CarModel.find(params[:edit]) if !params[:edit].blank?
      @production_year = ProductionYear.new
      @production_years = []
      @maintenance = Maintenance.new
      @maintenances = []

      if !params[:edit].blank?
        @car_model = CarModel.find(params[:edit])
        @production_years = @car_model.production_years
      end

    end

    if from == "production_year"
      @clear = all.last(1)

      @production_year = ProductionYear.find(params[:edit]) if !params[:edit].blank?
      @maintenance = Maintenance.new
      @maintenances = []

      if !params[:edit].blank?
        @production_year = ProductionYear.find(params[:edit])
        @maintenances = @production_year.maintenances
      end

    end

    if from == "maintenance"
      @clear = []

    end

  end


  def index
    @brand = Brand.new
    @car_model = CarModel.new
    @car_models = []
    @production_year = ProductionYear.new
    @production_years = []
    @maintenance = Maintenance.new
    @maintenances = []
  end



  def new_brand
    @brand = Brand.new
  end

  def edit_brand
    @brand = Brand.find(params[:id])
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
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.update_attributes!(params[:car_model])
  end

  def remove_car_model
    @brand = Brand.find(params[:brand_id])
    @car_model = CarModel.find(params[:car_model_id])

    @car_model.delete
    get_car_models()
  end



  def new_production_year
    @production_year = ProductionYear.new
  end

  def edit_production_year
    @production_year = ProductionYear.find(params[:production_year_id])
  end

  def add_production_year
    @car_model = CarModel.find(params[:car_model_id])
    @production_year = ProductionYear.new(params[:production_year])
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



  def new_maintenance
    @maintenance = Maintenance.new
  end

  def edit_maintenance
    @maintenance = Maintenance.find(params[:maintenance_id])
  end

  def add_maintenance
    @production_year = ProductionYear.find(params[:production_year_id])
    @maintenance = Maintenance.new(params[:maintenance])
    @maintenance.production_year = @production_year

    @maintenance.save!
    get_maintenances()
  end

  def save_maintenance
    @maintenance = Maintenance.find(params[:maintenance_id])

    @maintenance.update_attributes!(params[:maintenance])
  end

  def remove_maintenance
    @production_year = ProductionYear.find(params[:production_year_id])
    @maintenance = Maintenance.find(params[:maintenance_id])

    @maintenance.delete
    get_maintenances()
  end

end
