class CablesController < ApplicationController
  def index
    @cables = Cable.all
  end
end
