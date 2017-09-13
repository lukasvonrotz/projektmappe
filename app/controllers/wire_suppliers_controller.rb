class WireSuppliersController < ApplicationController
  def index
    if supplier = Supplier.find(params[:supplier_id])
      @wire_suppliers = supplier.wire_suppliers
      @supplier = supplier
    else
      @wire_suppliers = WireSupplier.all
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
