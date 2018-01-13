class DocumentsController < ApplicationController

  before_action :find_maintenance
  before_action :find_vehicle

  def index
    @vehicle = @maintenance.vehicle
    @documents = @maintenance.documents.all
    respond_to do |format|
      format.html
    end
  end
  def new
    @document = @maintenance.documents.build
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @document }
    end
  end

  def create
    @document = @maintenance.documents.build(document_params)
    if @document.save
      redirect_to [@vehicle, @maintenance], notice: 'Successfully created document.'
    else
      render 'new'
    end
  end
  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @document = @maintenance.documents.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_maintenance_path(@vehicle, @maintenance), notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:file)
  end
  def find_maintenance
      @maintenance = Maintenance.find(params[:maintenance_id])
  end
  def find_vehicle
      @vehicle = Vehicle.friendly.find(params[:vehicle_id])
  end
end
