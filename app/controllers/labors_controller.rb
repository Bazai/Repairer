class LaborsController < ApplicationController
  layout 'admin'
  # GET /labors
  # GET /labors.json
  def index
    @labors = Labor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labors }
    end
  end

  # GET /labors/1
  # GET /labors/1.json
  def show
    @labor = Labor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @labor }
    end
  end

  # GET /labors/new
  # GET /labors/new.json
  def new
    @labor = Labor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @labor }
    end
  end

  # GET /labors/1/edit
  def edit
    @labor = Labor.find(params[:id])
  end

  # POST /labors
  # POST /labors.json
  def create
    @labor = Labor.new(params[:labor])

    respond_to do |format|
      if @labor.save
        format.html { redirect_to @labor, notice: 'Labor was successfully created.' }
        format.json { render json: @labor, status: :created, location: @labor }
      else
        format.html { render action: "new" }
        format.json { render json: @labor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labors/1
  # PUT /labors/1.json
  def update
    @labor = Labor.find(params[:id])

    respond_to do |format|
      if @labor.update_attributes(params[:labor])
        format.html { redirect_to @labor, notice: 'Labor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @labor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labors/1
  # DELETE /labors/1.json
  def destroy
    @labor = Labor.find(params[:id])
    @labor.destroy

    respond_to do |format|
      format.html { redirect_to labors_url }
      format.json { head :ok }
    end
  end
end
