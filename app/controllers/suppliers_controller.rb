class SuppliersController < ApplicationController
  # Auflistung aller Lieferanten
  # GET /suppliers
    def index
      @suppliers = Supplier.all

      respond_to do |format|
        format.html
        format.csv { send_data @suppliers.to_csv, filename: "suppliers-#{Date.today}.csv" }
      end
    end

    # Control logic for create-view
    # GET /suppliers/new
    def new
      # build a 'temporary' post which is written to DB later (create-method)
      @supplier = Supplier.new
    end

    # Control logic when creating a new supplier
    # POST /suppliers
    def create
      @supplier = Supplier.new(supplier_params)

      # Wenn neu erstellter Lieferant ein Kabellieferant ist, dann Einträge in wire_suppliers für alle Kabel erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabel').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        Wire.all.each do |wire|
          wire_supplier = WireSupplier.create
          wire_supplier.supplier = @supplier
          wire_supplier.wire = wire
          wire_supplier.save!
        end
      end

      # Wenn neu erstellter Lieferant ein Kabelbeschriftungslieferant ist, dann einen neuen Eintrag in wirecaptionprices erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabelbeschriftung').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        wirecaptionprice = Wirecaptionprice.create
        wirecaptionprice.supplier = @supplier
        wirecaptionprice.save!
      end

      # Wenn neu erstellter Lieferant ein Elektroinstallationslieferant ist, dann Einträge in electrical_installation_suppliers für alle Elektroinstallationen erstellen
      suppliertypeid = Suppliertype.where(name: 'Elektroinstallation').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        ElectricalInstallation.all.each do |electrical_installation|
          electricalInstallationSupplier = ElectricalInstallationSupplier.create
          electricalInstallationSupplier.supplier = @supplier
          electricalInstallationSupplier.electrical_installation = electrical_installation
          electricalInstallationSupplier.save!
        end
      end

      # Wenn neu erstellter Lieferant ein FU Lieferant ist, dann Einträge in drive_suppliers für alle Drives erstellen
      suppliertypeid = Suppliertype.where(name: 'FU').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        Drive.all.each do |drive|
          driveSupplier = DriveSupplier.create
          driveSupplier.supplier = @supplier
          driveSupplier.drive = drive
          driveSupplier.save!
        end
      end

      # Wenn neu erstellter Lieferant ein Schaltanlagenbau Lieferant ist, dann Einträge in switchgear_suppliers für alle Switchgears erstellen
      suppliertypeid = Suppliertype.where(name: 'Schaltanlagenbau').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        Switchgear.all.each do |switchgear|
          switchgearSupplier = SwitchgearSupplier.create
          switchgearSupplier.supplier = @supplier
          switchgearSupplier.switchgear = switchgear
          switchgearSupplier.save!
        end
      end

      # write supplier to database
      if @supplier.save
        redirect_to suppliers_path, :notice => 'Lieferant erfolgreich erstellt.'
      else
        render 'new'
      end
    end

    # Control logic for show-view
    # GET /suppliers/:id
    def show
      @supplier = Supplier.find(params[:id])
    end

    # Control logic for edit-view
    # GET /suppliers/:id/edit
    def edit
      @supplier = Supplier.find(params[:id])
    end

    # Save an updated supplier
    # PUT /suppliers/:id
    def update
      @supplier = Supplier.find(params[:id])

      # Wenn updated Lieferant ein Kabellieferant ist, dann Einträge in wire_suppliers für alle Kabel erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabel').first.id
      if (supplier_params[:suppliertype_ids].include? suppliertypeid.to_s)
        if !WireSupplier.where(:supplier_id => @supplier.id).any?
          Wire.all.each do |wire|
            wire_supplier = WireSupplier.create
            wire_supplier.supplier = @supplier
            wire_supplier.wire = wire
            wire_supplier.save!
          end
        end
      else
        # allfällige Preisinträge die zu diesem Lieferanten vorhanden sind löschen
        WireSupplier.where(:supplier_id => @supplier.id).each do |wire_supplier|
          wire_supplier.destroy!
        end
      end

      # Wenn updated Lieferant ein Kabelbeschriftungslieferant ist, dann einen neuen Eintrag in wirecaptionprices erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabelbeschriftung').first.id
      if (supplier_params[:suppliertype_ids].include? suppliertypeid.to_s)
        if !Wirecaptionprice.where(:supplier_id => @supplier.id).any?
          wirecaptionprice = Wirecaptionprice.create
          wirecaptionprice.supplier = @supplier
          wirecaptionprice.save!
        end
      else
        # allfällige Preisinträge die zu diesem Lieferanten vorhanden sind löschen
        Wirecaptionprice.where(:supplier_id => @supplier.id).each do |wirecaptionprice|
          wirecaptionprice.destroy!
        end
      end

      # Wenn updated Lieferant ein Elektroinstallationslieferant ist, dann Einträge in electrical_installation_suppliers für alle Elektroinstallationen erstellen
      suppliertypeid = Suppliertype.where(name: 'Elektroinstallation').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        if !ElectricalInstallationSupplier.where(:supplier_id => @supplier.id).any?
          ElectricalInstallation.all.each do |electrical_installation|
            electricalInstallationSupplier = ElectricalInstallationSupplier.create
            electricalInstallationSupplier.supplier = @supplier
            electricalInstallationSupplier.electrical_installation = electrical_installation
            electricalInstallationSupplier.save!
          end
        end
      else
        # allfällige Preisinträge die zu diesem Lieferanten vorhanden sind löschen
        ElectricalInstallationSupplier.where(:supplier_id => @supplier.id).each do |electrical_installation_supplier|
          electrical_installation_supplier.destroy!
        end
      end

      # Wenn updated Lieferant ein FU Lieferant ist, dann Einträge in drive_suppliers für alle Drives erstellen
      suppliertypeid = Suppliertype.where(name: 'FU').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        if !DriveSupplier.where(:supplier_id => @supplier.id).any?
          Drive.all.each do |drive|
            driveSupplier = DriveSupplier.create
            driveSupplier.supplier = @supplier
            driveSupplier.drive = drive
            driveSupplier.save!
          end
        end
      else
        # allfällige Preisinträge die zu diesem Lieferanten vorhanden sind löschen
        DriveSupplier.where(:supplier_id => @supplier.id).each do |drive_supplier|
          drive_supplier.destroy!
        end
      end

      # Wenn neu erstellterupdated Lieferant ein Schaltanlagenbau Lieferant ist, dann Einträge in switchgear_suppliers für alle Switchgears erstellen
      suppliertypeid = Suppliertype.where(name: 'Schaltanlagenbau').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        if !SwitchgearSupplier.where(:supplier_id => @supplier.id).any?
          Switchgear.all.each do |switchgear|
            switchgearSupplier = SwitchgearSupplier.create
            switchgearSupplier.supplier = @supplier
            switchgearSupplier.switchgear = switchgear
            switchgearSupplier.save!
          end
        end
      else
        # allfällige Preisinträge die zu diesem Lieferanten vorhanden sind löschen
        SwitchgearSupplier.where(:supplier_id => @supplier.id).each do |switchgear_supplier|
          switchgear_supplier.destroy!
        end
      end

      if @supplier.update(supplier_params)
        redirect_to suppliers_path, :notice => 'Lieferant erfolgreich aktualisiert.'
      else
        render 'edit'
      end
    end

    # Delete a supplier
    # DELETE /suppliers/:id
    def destroy
      @supplier = Supplier.find(params[:id])
      if @supplier.wire_subsubprojects.any? || @supplier.wirecaption_subsubprojects.any? || @supplier.electrical_installation_subsubprojects.any? || @supplier.drive_subsubprojects.any? || @supplier.switchgear_subsubprojects.any?
        redirect_to suppliers_path, :alert => 'Lieferant konnte nicht gelöscht werden, da er bereits in Versionen verknüpft ist.'
      else
        @supplier.destroy
        redirect_to suppliers_path, :notice => 'Lieferant wurde gelöscht.'
      end
    end

    # CSV Import
    def import
      status = Supplier.import(params[:file])
      if !(status == '')
        redirect_to suppliers_path, :alert => status
      else
        redirect_to suppliers_path, :notice => 'Lieferanten-Liste erfolgreich aktualisiert.'
      end
    end

    private
    # defines which parameters have to be provided by the form when creating a new supplier
    def supplier_params
      params.require(:supplier).permit(:name, {:suppliertype_ids => []})
    end

end
