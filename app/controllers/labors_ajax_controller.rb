class LaborsAjaxController < ApplicationController

  def get_labors
    @labors = Labor.find_all_by_maintenance_id(@maintenance.id, :order => "name")
  end

  def new
    @labor = Labor.new
  end

  def edit
    @labor = Labor.find(params[:labor_id])
  end

  def create
    @maintenance = Maintenance.find(params[:maintenance_id])
    @labor = Labor.new(params[:labor])
    @labor.maintenance = @maintenance

    @labor.save!
    get_labors()
  end

  def update
    @labor = Labor.find(params[:labor_id])

    @labor.update_attributes!(params[:labor])
  end

  def destroy
    @maintenance = Maintenance.find(params[:maintenance_id])
    @labor = Labor.find(params[:labor_id])

    @labor.destroy
    get_labors()
  end

end
