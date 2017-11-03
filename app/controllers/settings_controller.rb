class SettingsController < ApplicationController
  # Settings View
  # GET /settings
  def index
  end

  # export all relevant tables into a csv
  # GET /settings/csvexport_all_tables
  def csvexport_all_tables
    @wires = Wire.all.sort_by {|obj| obj.kabeltyp}
    @switchgears_einbau = Switchgear.all.sort_by {|obj| obj.kennung}
    @switchgears = Switchgear.where(:typ => 1).sort_by {|obj| obj.kennung}
    @assemblies = Assembly.all.sort_by {|obj| obj.kennung}
    @electrical_installations = ElectricalInstallation.all.sort_by {|obj| obj.kennung}
    @drives = Drive.all.sort_by {|obj| obj.kennung}
    @devices = Device.all.sort_by {|obj| obj.definition}
    @iogroups = Iogroup.all.sort_by {|obj| obj.name}
    @switchgearcombinations = Switchgearcombination.all.sort_by {|obj| obj.name}
    @offertpositions = Offertposition.where(:subsubproject_id => params[:subsubproject_id]).sort_by {|obj| obj.name}
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subsubprojects = @subsubproject.subproject.subsubprojects.sort_by {|obj| obj.name}
    @subsystems = Subsystem.all.sort_by {|obj| obj.name}
    @units = Unit.all.sort_by {|obj| obj.name}

    CSV.open("export_all_tables#{Time.now.strftime("%Y-%m-%d-%H-%M")}.csv", "wb", {:headers => true, :encoding => "iso-8859-1", :col_sep => ";"}) do |csv|
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
      @switchgears.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Schaltschrankeinbautypen', '']
      @switchgears_einbau.each do |entry| csv << [entry.id, entry.kennung] end
      csv << ['Schaltgeraetekombinationen', '']
      @switchgearcombinations.each do |entry| csv << [entry.id, entry.name] end
      csv << ['IO-Gruppen', '']
      @iogroups.each do |entry| csv << [entry.id, entry.name] end
      csv << ['Offertpositionen', '']
      @offertpositions.each do |entry| csv << [entry.id, entry.name] end
      csv << ['Teilanlagen', '']
      @subsystems.each do |entry| csv << [entry.id, entry.name] end
      csv << ['TeilanlagenUnits', '']
      @units.each do |entry| csv << [entry.id, entry.name] end
      csv << ['Projektversionen', '']
      @subsubprojects.each do |entry| csv << [entry.id, entry.name] end
    end

    redirect_to settings_path, :notice => "Export wurde unter " + Rails.root.to_s + "/ abgelegt!"
  end
end
