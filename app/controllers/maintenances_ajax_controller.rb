class MaintenancesAjaxController < ApplicationController

  def get_maintenances
    @maintenances = Maintenance.find_all_by_production_year_id(@production_year.id, :order => "description")
  end

  def new
    @maintenance = Maintenance.new
  end

  def edit
    @maintenance = Maintenance.find(params[:maintenance_id])
  end

  def create
    @production_year = ProductionYear.find(params[:production_year_id])
    @maintenance = Maintenance.new(params[:maintenance])
    @maintenance.production_year = @production_year

    @maintenance.save!
    get_maintenances()
  end

  def update
    @maintenance = Maintenance.find(params[:maintenance_id])

    @maintenance.update_attributes!(params[:maintenance])
  end

  def destroy
    @production_year = ProductionYear.find(params[:production_year_id])
    @maintenance = Maintenance.find(params[:maintenance_id])

    @maintenance.delete
    get_maintenances()
  end

end
