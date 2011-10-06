class PartsAjaxController < ApplicationController

  def get_parts
    @parts = @maintenance.parts(:order => "name")
  end

  def new
    @part = Part.new
  end

  def edit
    @part = Part.find(params[:part_id])
  end

  def create
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.new(params[:part])
    @part.maintenances << @maintenance

    @part.save!
    get_parts()
  end

  def update
    @part = Part.find(params[:part_id])

    @part.update_attributes!(params[:part])
  end

  def destroy
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.find(params[:part_id])

    @part.delete
    get_parts()
  end

end
