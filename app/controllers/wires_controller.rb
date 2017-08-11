class WiresController < ApplicationController
  def index
    @wires = Wire.all
  end
end
