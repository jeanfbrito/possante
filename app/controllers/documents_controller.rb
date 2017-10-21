class DocumentsController < ApplicationController

  before_filter :find_maintenance
  before_filter :find_vehicle

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
      redirect_to [@vehicle, @maintenance], notice: 'Successfully created refuelling.'
    else
      render 'new'
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
