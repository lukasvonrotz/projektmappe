class IogroupsController < ApplicationController
  def index
    @iogroups = Iogroup.all
  end

  # Control logic for create-view
  # GET /iogroups/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @iogroup = Iogroup.new
  end

  # Control logic when creating a new iogroup
  # POST /iogroups
  def create
    @iogroup = Iogroup.new(iogroup_params)

    # write iogroup to database
    if @iogroup.save
      redirect_to iogroups_path, :notice => 'IO-Gruppe erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /iogroups/:id
  def show
    @iogroup = Iogroup.find(params[:id])
  end

  # Control logic for edit-view
  # GET /iogroups/:id/edit
  def edit
    @iogroup = Iogroup.find(params[:id])
  end

  # Save an updated iogroup
  # PUT /iogroups/:id
  def update
    @iogroup = Iogroup.find(params[:id])
    if @iogroup.update(iogroup_params)
      redirect_to iogroups_path, :notice => 'IO-Gruppe erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a iogroup
  # DELETE /iogroups/:id
  def destroy
    @iogroup = Iogroup.find(params[:id])
    @iogroup.destroy
    redirect_to iogroups_path, :notice => 'IO-Gruppe wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new iogroup
  def iogroup_params
    params.require(:iogroup).permit(:name, :profibus_address, :iotype_id, :switchgearcombination_id,
                                    {:assembly_ids => []})
  end
end
