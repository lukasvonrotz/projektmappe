class SettingsController < ApplicationController
  # Settings View
  # GET /settings
  def index
  end

  # export all relevant tables into a csv
  # GET /settings/csvexport_all_tables
  def csvexport_all_tables
    @wires = Wire.all
    @switchgears = Switchgear.all
    @assemblies = Assembly.all
    @electrical_installations = ElectricalInstallation.all
    @drives = Drive.all
    @devices = Device.all
    @iogroups = Iogroup.all
    @switchgearcombinations = Switchgearcombination.all

    CSV.open("export_all_tables#{Time.now.strftime("%Y-%m-%d-%H-%M")}.csv", "wb", {:headers => true, :encoding => "utf-8", :col_sep => ";"}) do |csv|
      csv << ['id', 'name']
      @wires.each do |entry| csv << [entry.id, entry.kabeltyp] end
      csv << ['', '']
      @switchgears.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['', '']
      @assemblies.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['', '']
      @electrical_installations.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['', '']
      @drives.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['', '']
      @devices.each do |entry| csv << [entry.id, entry.definition] end
      csv << ['', '']
      @iogroups.each do |entry| csv << [entry.id, entry.name] end
      csv << ['', '']
      @switchgearcombinations.each do |entry| csv << [entry.id, entry.name] end
      csv << ['', '']
    end

    redirect_to settings_path, :notice => "Export wurde unter " + Rails.root.to_s + "/ abgelegt!"
  end
end
