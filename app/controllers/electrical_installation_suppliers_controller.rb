class ElectricalInstallationSuppliersController < ApplicationController
  # Elektroinstallationspreise zu Lieferant bearbeiten
  # GET /suppliers/:supplier_id/electrical_installation_suppliers
  def index
    begin
      supplier = Supplier.find(params[:supplier_id])
      @electrical_installation_suppliers = supplier.electrical_installation_suppliers
      @supplier = supplier
      @formview = true
    rescue
      @electrical_installation_suppliers = ElectricalInstallationSupplier.all
      @formview = false
      respond_to do |format|
        format.html
        format.csv { send_data @electrical_installation_suppliers.to_csv, filename: "electrical_installation_suppliers-#{Date.today}.csv" }
      end
    end
  end

  # Elektroinstallationspreise zu Lieferant speichern
  # GET /suppliers/:supplier_id/electrical_installation_suppliers
  def update
    @electrical_installation_supplier = ElectricalInstallationSupplier.find(params[:id])
    if @electrical_installation_supplier.update(electrical_installation_supplier_params)
      redirect_to supplier_electrical_installation_suppliers_path, :notice => 'Elektroinstallationspreise erfolgreich aktualisiert!'
    else
      redirect_to supplier_electrical_installation_suppliers_path, :alert => 'Elektroinstallationspreise konnten nicht aktualisiert werden!'
    end
  end

  # CSV Import
  def import
    status = ElectricalInstallationSupplier.import(params[:file])
    if !(status == '')
      redirect_to electrical_installation_suppliers_path, :alert => status
    else
      redirect_to electrical_installation_suppliers_path, :notice => 'Elektroinstallationspreise erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form
  def electrical_installation_supplier_params
    params.require(:electrical_installation_supplier).permit(:brutto, :rabatt)
  end
end
