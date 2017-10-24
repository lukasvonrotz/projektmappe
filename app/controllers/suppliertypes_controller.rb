class SuppliertypesController < ApplicationController
  # Auflistung aller Lieferantentypen
  # GET /suppliertypes
  def index
    @suppliertypes = Suppliertype.all

    respond_to do |format|
      format.html
      format.csv { send_data @suppliertypes.to_csv, filename: "suppliertypes-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /suppliertypes/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @suppliertype = Suppliertype.new
  end

  # Control logic when creating a new suppliertype
  # POST /suppliertypes
  def create
    @suppliertype = Suppliertype.new(suppliertype_params)

    # write suppliertype to database
    if @suppliertype.save
      redirect_to suppliertypes_path, :notice => 'Lieferantentyp erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /suppliertypes/:id
  def show
    @suppliertype = Suppliertype.find(params[:id])
  end

  # Control logic for edit-view
  # GET /suppliertypes/:id/edit
  def edit
    @suppliertype = Suppliertype.find(params[:id])
  end

  # Save an updated suppliertype
  # PUT /suppliertypes/:id
  def update
    @suppliertype = Suppliertype.find(params[:id])
    if @suppliertype.update(suppliertype_params)
      redirect_to suppliertypes_path, :notice => 'Lieferantentyp erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a suppliertype
  # DELETE /suppliertypes/:id
  def destroy
    @suppliertype = Suppliertype.find(params[:id])
    @suppliertype.destroy
    redirect_to suppliertypes_path, :notice => 'Lieferantentyp wurde gelöscht.'
  end

  # CSV Import
  def import
    status = Suppliertype.import(params[:file])
    if !(status == '')
      redirect_to suppliertypes_path, :alert => status
    else
      redirect_to suppliertypes_path, :notice => 'Lieferantentypen erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new suppliertype
  def suppliertype_params
    params.require(:suppliertype).permit!
  end
end
