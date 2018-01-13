class RefuellingsController < ApplicationController
  before_action :set_refuelling, only: [:show, :edit, :update, :destroy]
  before_action :find_vehicle
  # GET /refuellings
  # GET /refuellings.json
  def index
    @refuellings = @vehicle.refuellings.order('date desc').page(params[:page])
  end

  # GET /refuellings/1
  # GET /refuellings/1.json
  def show
  end

  # GET /refuellings/new
  def new
    @refuelling = @vehicle.refuellings.build
  end

  # GET /refuellings/1/edit
  def edit
    @refuelling = @vehicle.refuellings.find(params[:id])
  end

  # POST /refuellings
  # POST /refuellings.json
  def create
    @refuelling = @vehicle.refuellings.build(refuelling_params)

    respond_to do |format|
      if @refuelling.save
        format.html { redirect_to [@vehicle, :refuellings], notice: 'Refuelling was successfully created.' }
        format.json { render :show, status: :created, location: @refuelling }
      else
        format.html { render :new }
        format.json { render json: @refuelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refuellings/1
  # PATCH/PUT /refuellings/1.json
  def update
    @refuelling = @vehicle.refuellings.find(params[:id])
    respond_to do |format|
      if @refuelling.update(refuelling_params)
        format.html { redirect_to vehicle_refuellings_path(@vehicle), notice: 'Refuelling was successfully updated.' }
        format.json { render :show, status: :ok, location: @refuelling }
      else
        format.html { render :edit }
        format.json { render json: @refuelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refuellings/1
  # DELETE /refuellings/1.json
  def destroy
    @refuelling.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_refuellings_url(@vehicle), notice: 'Refuelling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refuelling
      @refuelling = Refuelling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refuelling_params
      params.require(:refuelling).permit(:date, :mileage, :liter_price, :liters, :gas_station, :traveled_mileage, :total_value, :result)
    end

    def find_vehicle
      @vehicle = Vehicle.friendly.find(params[:vehicle_id])
    end
end
