class ModificationsController < ApplicationController
  respond_to :js
  before_filter :get_brands
  #after_filter :get_brands, :only => [:add_brand, :save_brand, :remove_brand]
  
  layout 'admin'

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
    @brands = Brand.all(:order => "name")
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
  end
end
