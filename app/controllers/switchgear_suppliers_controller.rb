class SwitchgearSuppliersController < ApplicationController
  # Schaltanlagenbaupreise zu Lieferant bearbeiten
  # GET /suppliers/:supplier_id/switchgear_suppliers
  def index
    begin
      supplier = Supplier.find(params[:supplier_id])
      @switchgear_suppliers = supplier.switchgear_suppliers
      @supplier = supplier
      @formview = true
    rescue
      @switchgear_suppliers = SwitchgearSupplier.all
      @formview = false
      respond_to do |format|
        format.html
        format.csv { send_data @switchgear_suppliers.to_csv, filename: "switchgear_suppliers-#{Date.today}.csv" }
      end
    end
  end

  # Schaltanlagenbaupreise zu Lieferant speichern
  # GET /suppliers/:supplier_id/switchgear_suppliers
  def update
    @switchgear_supplier = SwitchgearSupplier.find(params[:id])
    if @switchgear_supplier.update(switchgear_supplier_params)
      redirect_to supplier_switchgear_suppliers_path, :notice => 'Schaltanlagenbaupreise erfolgreich aktualisiert!'
    else
      redirect_to supplier_switchgear_suppliers_path, :alert => 'Schaltanlagenbau-Preise konnten nicht aktualisiert werden!'
    end
  end

  # CSV Import
  def import
    status = SwitchgearSupplier.import(params[:file])
    if !(status == '')
      redirect_to switchgear_suppliers_path, :alert => status
    else
      redirect_to switchgear_suppliers_path, :notice => 'Schaltanlagenbaupreise erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form
  def switchgear_supplier_params
    params.require(:switchgear_supplier).permit(:brutto, :rabatt)
  end
end
