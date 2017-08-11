class WiresuppliersController < ApplicationController
  def index
    @wiresupplier = Wiresupplier.all
  end
end
