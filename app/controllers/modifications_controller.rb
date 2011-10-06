class ModificationsController < ApplicationController
  layout 'admin'

  def get_brands
    @brands = Brand.all(:order => "name")
  end

  def get_car_models
    @car_models = CarModel.find_all_by_brand_id(@brand.id, :order => "name")
  end

  def get_production_years
    @production_years = ProductionYear.find_all_by_car_model_id(@car_model.id, :order => "year")
  end

  def get_maintenances
    @maintenances = Maintenance.find_all_by_production_year_id(@production_year.id, :order => "description")
  end

  def get_labors
    @labors = Labor.find_all_by_maintenance_id(@maintenance.id, :order => "name")
  end

  def get_parts
    @parts = @maintenance.parts(:order => "name")
  end

  def clear
    all = ["car_model", "production_year", "maintenance", "labor", "part"]

    from = params[:from]

    if from == "brand"
      @clear = all

      if !params[:edit].blank?
        @brand = Brand.find(params[:edit])
        @car_models = @brand.car_models
      end
    end

    if from == "car_model"
      @clear = all.last(4)

      if !params[:edit].blank?
        @car_model = CarModel.find(params[:edit])
        @production_years = @car_model.production_years
      end
    end

    if from == "production_year"
      @clear = all.last(3)

      if !params[:edit].blank?
        @production_year = ProductionYear.find(params[:edit])
        @maintenances = @production_year.maintenances
      end
    end

    if from == "maintenance"
      @clear = all.last(2)

      if !params[:edit].blank?
        @maintenance = Maintenance.find(params[:edit])
        @labors = @maintenance.labors
        @parts = @maintenance.parts
      end
    end

    if from == "labor"
      @clear = []
    end

    if from == "part"
      @clear = []
    end

    if (@clear.include?("car_model"))
      @car_model = CarModel.new
      @car_models = [] if (@car_models.blank?)
    end
    if (@clear.include?("production_year"))
      @production_year = ProductionYear.new
      @production_years = [] if (@production_years.blank?)
    end
    if (@clear.include?("maintenance"))
      @maintenance = Maintenance.new
      @maintenances = [] if (@maintenances.blank?)
    end
    if (@clear.include?("labor"))
      @labor = Labor.new
      @labors = [] if (@labors.blank?)
    end
    if (@clear.include?("part"))
      @part = Part.new
      @parts = [] if (@parts.blank?)
    end

  end

  def search_ex_part
    @all_parts = Part.all(:conditions => ["name like ?", "%" + params[:search] + "%"])
  end

  def add_ex_part
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.find(params[:part_id])
    @maintenance.parts << @part
    get_parts()
  end

  def index
    @brand = Brand.new
    @car_model = CarModel.new
    @car_models = []
    @production_year = ProductionYear.new
    @production_years = []
    @maintenance = Maintenance.new
    @maintenances = []
    @labor = Labor.new
    @labors = []
    @part = Part.new
    @parts = []

    @all_parts = Part.all

    get_brands()
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





  def new_labor
    @labor = Labor.new
  end

  def edit_labor
    @labor = Labor.find(params[:labor_id])
  end

  def add_labor
    @maintenance = Maintenance.find(params[:maintenance_id])
    @labor = Labor.new(params[:labor])
    @labor.maintenance = @maintenance

    @labor.save!
    get_labors()
  end

  def save_labor
    @labor = Labor.find(params[:labor_id])

    @labor.update_attributes!(params[:labor])
  end

  def remove_labor
    @maintenance = Maintenance.find(params[:maintenance_id])
    @labor = Labor.find(params[:labor_id])

    @labor.delete
    get_labors()
  end





  def new_part
    @part = Part.new
  end

  def edit_part
    @part = Part.find(params[:part_id])
  end

  def add_part
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.new(params[:part])
    @part.maintenances << @maintenance

    @part.save!
    get_parts()
  end

  def save_part
    @part = Part.find(params[:part_id])

    @part.update_attributes!(params[:part])
  end

  def remove_part
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.find(params[:part_id])

    @part.delete
    get_parts()
  end

end
