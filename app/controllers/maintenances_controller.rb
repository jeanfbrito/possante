class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]
  before_filter :find_vehicle

  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = @vehicle.maintenances.order('date desc').page(params[:page])
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
    @documents = @maintenance.documents
  end

  # GET /maintenances/new
  def new
    @maintenance = @vehicle.maintenances.build
  end

  # GET /maintenances/1/edit
  def edit
    @maintenance = @vehicle.maintenances.find(params[:id])
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = @vehicle.maintenances.build(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to [@vehicle, :maintenances], notice: 'Maintenance was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    @maintenance = @vehicle.maintenances.find(params[:id])
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to vehicle_maintenances_path(@vehicle), notice: 'Maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url, notice: 'Maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance).permit(:date, :cost, :description, :warranty, :mileage, :vehicle_id, :warranty_status, :type)
    end

    def find_vehicle
      @vehicle = Vehicle.friendly.find(params[:vehicle_id])
    end
end
