class WirecaptionpricesController < ApplicationController

  def create
    @wirecaptionprice = Wirecaptionprice.new(wirecaptionprice_params)
    if @wirecaptionprice.save
    # write wire to database
      redirect_to suppliers_path
    else
      render 'new'
    end
  end

  # Control logic for edit-view
  # GET /wirecaptionprices/:id/edit
  def edit
    @wirecaptionprice = Wirecaptionprice.find(params[:id])
  end

  # Save an updated wirecaptionprice
  # This method is either called from the wirecaptionprice edit-view (GET /wirecaptionprices/:id/edit)
  # or the wirecaptionprice filter-view (GET /wirecaptionprices/:id/filter)
  # PUT /wirecaptionprices/:id
  def update
    @wirecaptionprice = Wirecaptionprice.find(params[:id])
    if @wirecaptionprice.update(wirecaptionprice_params)
      redirect_to suppliers_path, :notice => 'Beschriftungspreise erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new wirecaptionprice
  def wirecaptionprice_params
    params.require(:wirecaptionprice).permit!
  end
end
