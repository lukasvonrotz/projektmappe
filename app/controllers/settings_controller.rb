class SettingsController < ApplicationController
  # Settings View
  # GET /settings
  def index
  end

  # export all relevant tables into a csv
  # GET /settings/csvexport_all_tables
  def csvexport_all_tables
    @wires = Wire.all.sort_by {|obj| obj.id}
    @switchgears_einbau = Switchgear.all.sort_by {|obj| obj.id}
    @switchgears = Switchgear.where(:typ => 1).sort_by {|obj| obj.id}
    @assemblies = Assembly.all.sort_by {|obj| obj.id}
    @electrical_installations = ElectricalInstallation.all.sort_by {|obj| obj.id}
    @drives = Drive.all.sort_by {|obj| obj.id}
    @devices = Device.all.sort_by {|obj| obj.id}
    @iogroups = Iogroup.all.sort_by {|obj| obj.id}
    @switchgearcombinations = Switchgearcombination.all.sort_by {|obj| obj.id}

    CSV.open("export_all_tables#{Time.now.strftime("%Y-%m-%d-%H-%M")}.csv", "wb", {:headers => true, :encoding => "utf-8", :col_sep => ";"}) do |csv|
      csv << ['Geraetetypen', '']
      @devices.each do |entry| csv << [entry.id, entry.definition] end
      csv << ['SPS-Modultypen', '']
      @assemblies.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Frequenzumrichtertypen', '']
      @drives.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Kabeltypen', '']
      @wires.each do |entry| csv << [entry.id, entry.kabeltyp] end
      csv << ['Elektroinstallationstypen', '']
      @electrical_installations.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Schaltschranktypen', '']
      @switchgears_einbau.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Schaltschrankeinbautypen', '']
      @switchgears.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Schaltgeraetekombinationen', '']
      @switchgearcombinations.each do |entry| csv << [entry.id, entry.name] end
      csv << ['IO-Gruppen', '']
      @iogroups.each do |entry| csv << [entry.id, entry.name] end
    end

    redirect_to settings_path, :notice => "Export wurde unter " + Rails.root.to_s + "/ abgelegt!"
  end
end
