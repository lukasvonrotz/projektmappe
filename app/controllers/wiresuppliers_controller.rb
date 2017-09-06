class WiresuppliersController < ApplicationController
  def index
    @wiresuppliers = Wiresupplier.all
  end
end
