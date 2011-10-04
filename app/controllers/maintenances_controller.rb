class MaintenancesController < ApplicationController
  layout 'admin'
  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = Maintenance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenances }
    end
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintenance }
    end
  end

  # GET /maintenances/new
  # GET /maintenances/new.json
  def new
    @maintenance = Maintenance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintenance }
    end
  end

  # GET /maintenances/1/edit
  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = Maintenance.new(params[:maintenance])

    respond_to do |format|
      if @maintenance.save
        params[:exparts].each { |part| @maintenance.parts << Part.find(part) }

        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
        format.json { render json: @maintenance, status: :created, location: @maintenance }
      else
        format.html { render action: "new" }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maintenances/1
  # PUT /maintenances/1.json
  def update
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      if @maintenance.update_attributes(params[:maintenance])
        params[:exparts].each { |part| @maintenance.parts << Part.find(part) }

        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy

    respond_to do |format|
      format.html { redirect_to maintenances_url }
      format.json { head :ok }
    end
  end

  def addpart
    @part = Part.find(params[:part_id])
  end
end
