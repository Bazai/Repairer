class CarModelsController < ApplicationController
  # GET /car_models
  # GET /car_models.json
  def index
    @car_models = CarModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @car_models }
    end
  end

  # GET /car_models/1
  # GET /car_models/1.json
  def show
    @car_model = CarModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car_model }
    end
  end

  # GET /car_models/new
  # GET /car_models/new.json
  def new
    @car_model = CarModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car_model }
    end
  end

  # GET /car_models/1/edit
  def edit
    @car_model = CarModel.find(params[:id])
  end

  # POST /car_models
  # POST /car_models.json
  def create
    @car_model = CarModel.new(params[:car_model])

    respond_to do |format|
      if @car_model.save
        format.html { redirect_to @car_model, notice: 'Car model was successfully created.' }
        format.json { render json: @car_model, status: :created, location: @car_model }
      else
        format.html { render action: "new" }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /car_models/1
  # PUT /car_models/1.json
  def update
    @car_model = CarModel.find(params[:id])

    respond_to do |format|
      if @car_model.update_attributes(params[:car_model])
        format.html { redirect_to @car_model, notice: 'Car model was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_models/1
  # DELETE /car_models/1.json
  def destroy
    @car_model = CarModel.find(params[:id])
    @car_model.destroy

    respond_to do |format|
      format.html { redirect_to car_models_url }
      format.json { head :ok }
    end
  end
end
