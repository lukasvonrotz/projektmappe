class WirecaptionsuppliersController < ApplicationController
  def index
    @wirecaptionsupplier = Wirecaptionsupplier.all
  end
end
