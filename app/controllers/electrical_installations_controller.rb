class ElectricalInstallationsController < ApplicationController
  # Auflistung aller Elektroinstallationen
  # GET /electrical_installations
  def index
    @electrical_installations = ElectricalInstallation.all
    @electricalinstallationsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Elektroinstallation'})

    respond_to do |format|
      format.html
      format.csv { send_data @electrical_installations.to_csv, filename: "electricalinstallations-#{Date.today}.csv" }
    end

    # Check whether all prices of all electrical installation suppliers are provided in database
    @allPricesEntered = 0
    @electrical_installations.each do |electrical_installation|
      @electricalinstallationsuppliers.each do |electricalinstallationsupplier|
        begin
          electricalinstallationSupplierEntry = ElectricalInstallationSupplier.where(["electrical_installation_id = ? and supplier_id = ?", electrical_installation.id, electricalinstallationsupplier.id]).first
          brutto = electricalinstallationSupplierEntry.brutto
          rabatt = electricalinstallationSupplierEntry.rabatt

          if brutto.nil? or rabatt.nil?
            @allPricesEntered = electricalinstallationSupplierEntry.supplier_id
          end
        rescue
          @allPricesEntered = electricalinstallationSupplierEntry.id
        end
      end
    end
  end

  # Control logic for create-view
  # GET /electrical_installations/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @electrical_installation = ElectricalInstallation.new
  end

  # Control logic when creating a new electrical_installation
  # POST /electrical_installations
  def create
    @electrical_installation = ElectricalInstallation.new(electrical_installations_params)
    # write electrical_installation to database
    if @electrical_installation.save
      @electricalinstallationsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Elektroinstallation'})
      # Einträge in electrical_installation_suppliers für alle Elektroinstallationslieferanten mit neuer Elektroinstallation erstellen
      @electricalinstallationsuppliers.each do |electricalinstallationsupplier|
        electricalinstallationSupplierEntry = ElectricalInstallationSupplier.new
        electricalinstallationSupplierEntry.electrical_installation_id = @electrical_installation.id
        electricalinstallationSupplierEntry.supplier_id = electricalinstallationsupplier.id
        electricalinstallationSupplierEntry.save!
      end
      redirect_to electrical_installations_path, :notice => 'Eintrag erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /electrical_installations/:id
  def show
    @electrical_installation = ElectricalInstallation.find(params[:id])
    @electrical_installationsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Elektroinstallation'})
  end

  # Control logic for edit-view
  # GET /electrical_installations/:id/edit
  def edit
    @electrical_installation = ElectricalInstallation.find(params[:id])
  end

  # Save an updated electrical_installation
  # This method is either called from the electrical_installation edit-view (GET /electrical_installations/:id/edit)
  # or the electrical_installation filter-view (GET /electrical_installations/:id/filter)
  # PUT /electrical_installations/:id
  def update
    @electrical_installation = ElectricalInstallation.find(params[:id])
    if @electrical_installation.update(electrical_installations_params)
      redirect_to electrical_installations_path, :notice => 'Eintrag erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a electrical_installation
  # DELETE /electrical_installations/:id
  def destroy
    @electrical_installation = ElectricalInstallation.find(params[:id])
    @electrical_installation.destroy
    redirect_to electrical_installations_path, :notice => 'Eintrag wurde gelöscht.'
  end

  # CSV Import
  def import
    status = ElectricalInstallation.import(params[:file])
    if !(status == '')
      redirect_to electrical_installations_path, :alert => status
    else
      redirect_to electrical_installations_path, :notice => 'Elektoinstallationen erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new electrical_installation
  def electrical_installations_params
    params.require(:electrical_installation).permit!
  end
end
