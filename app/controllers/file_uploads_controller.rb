class FileUploadsController < ApplicationController
  before_action :find_maintenance
  before_action :find_vehicle

  def new
    #@maintenance = Maintenance.find(params[:maintenance_id])
  end
  def create
    @maintenance.files.attach(params[:maintenance][:files])
    redirect_to vehicle_maintenance_path(@vehicle, @maintenance)
  end
  def destroy
    @maintenance.files.find(params[:id]).purge
    redirect_to vehicle_maintenance_path(@vehicle, @maintenance)
  end
  private
    def find_maintenance
        @maintenance = Maintenance.find(params[:maintenance_id])
    end
    def find_vehicle
        @vehicle = Vehicle.friendly.find(params[:vehicle_id])
    end
end
