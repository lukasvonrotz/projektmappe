class WireWiresuppliersController < ApplicationController
  def index
    if wiresupplier = Wiresupplier.find(params[:wiresupplier_id])
      @wire_wiresuppliers = wiresupplier.wire_wiresuppliers
      @wiresupplier = wiresupplier
    else
      @wire_wiresuppliers = WireWiresupplier.all
    end
  end

  def update
    @wire_wiresupplier = WireWiresupplier.find(params[:id])
    if @wire_wiresupplier.update(wire_wiresupplier_params)
      redirect_to wiresupplier_wire_wiresuppliers_path, :notice => 'Kabelpreise erfolgreich aktualisiert!'
    else
      render 'edit'
    end
  end

  private
  # defines which parameters have to be provided by the form
  def wire_wiresupplier_params
    params.require(:wire_wiresupplier).permit(:anschlusstableauseite,
                                              :anschlussgeraeteseite,
                                              :beschriftungkabeleinanschluss,
                                              :beschriftungaderneinanschluss,
                                              :installationhohlboden,
                                              :installationtrasse,
                                              :installationrohr)
  end
end
