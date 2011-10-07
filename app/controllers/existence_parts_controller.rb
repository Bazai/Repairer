class ExistencePartsController < ApplicationController

  def search
    @all_parts = Part.all(:conditions => ["name like ?", "%" + params[:search] + "%"])
  end

  def add
    @maintenance = Maintenance.find(params[:maintenance_id])
    @part = Part.find(params[:part_id])
    @maintenance.parts << @part
    get_parts()
  end

end
