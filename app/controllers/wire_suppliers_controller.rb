class WireSuppliersController < ApplicationController
  def index
    begin
      supplier = Supplier.find(params[:supplier_id])
      @wire_suppliers = supplier.wire_suppliers
      @supplier = supplier
      @formview = true
    rescue
      @wire_suppliers = WireSupplier.all
      @formview = false
      respond_to do |format|
        format.html
        format.csv { send_data @wire_suppliers.to_csv, filename: "wire_suppliers-#{Date.today}.csv" }
      end
    end
  end

  def update
    @wire_supplier = WireSupplier.find(params[:id])
    if @wire_supplier.update(wire_supplier_params)
      redirect_to supplier_wire_suppliers_path, :notice => 'Kabelpreise erfolgreich aktualisiert!'
    else
      render 'edit'
    end
  end

  def import
    status = WireSupplier.import(params[:file])
    if !status.nil?
      redirect_to wire_suppliers_path, :notice => status
    else
      redirect_to wire_suppliers_path, :notice => 'Kabel-Lieferantenpreise erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form
  def wire_supplier_params
    params.require(:wire_supplier).permit(:anschlusstableauseite,
                                              :anschlussgeraeteseite,
                                              :beschriftungkabeleinanschluss,
                                              :beschriftungaderneinanschluss,
                                              :installationhohlboden,
                                              :installationtrasse,
                                              :installationrohr)
  end
end
