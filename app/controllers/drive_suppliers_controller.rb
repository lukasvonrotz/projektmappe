class DriveSuppliersController < ApplicationController
  # FU-Preise zu Lieferant bearbeiten
  # GET /suppliers/:supplier_id/drive_suppliers
  def index
    begin
      supplier = Supplier.find(params[:supplier_id])
      @drive_suppliers = supplier.drive_suppliers
      @supplier = supplier
      @formview = true
    rescue
      @drive_suppliers = DriveSupplier.all
      @formview = false
      respond_to do |format|
        format.html
        format.csv { send_data @drive_suppliers.to_csv, filename: "drive_suppliers-#{Date.today}.csv" }
      end
    end
  end

  # FU-Preise zu Lieferant speichern
  # GET /suppliers/:supplier_id/drive_suppliers
  def update
    @drive_supplier = DriveSupplier.find(params[:id])
    if @drive_supplier.update(drive_supplier_params)
      redirect_to supplier_drive_suppliers_path, :notice => 'FU-Preise erfolgreich aktualisiert!'
    else
      redirect_to supplier_drive_suppliers_path, :alert => 'FU-Preise konnten nicht aktualisiert werden!'
    end
  end

  # CSV Import
  def import
    status = DriveSupplier.import(params[:file])
    if !(status == '')
      redirect_to drive_suppliers_path, :alert => status
    else
      redirect_to drive_suppliers_path, :notice => 'FU-Preise erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form
  def drive_supplier_params
    params.require(:drive_supplier).permit(:brutto, :rabatt)
  end
end
