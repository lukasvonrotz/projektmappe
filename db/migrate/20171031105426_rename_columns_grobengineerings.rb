class RenameColumnsGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    rename_column :grobengineerings, :hw_device_supplier, :hwdevice_manufact
    rename_column :grobengineerings, :hw_device_type, :hwdevice_typecode
    rename_column :grobengineerings, :hw_device_type_nr, :hwdevice_linkdatasheet
    rename_column :grobengineerings, :motor_speed, :motor_rpm
    rename_column :grobengineerings, :motor_anschluss, :motor_contype
    rename_column :grobengineerings, :motor_drehzahlgeber_fu, :motor_encoder_fc
    rename_column :grobengineerings, :standort, :hwdevice_location
    rename_column :grobengineerings, :montagephase, :hwdevice_inst_phase
    rename_column :grobengineerings, :bmk_anlage, :bmk_plant
    rename_column :grobengineerings, :bmk_ort, :bmk_location
    rename_column :grobengineerings, :bmk_nummer, :bmk_number
    rename_column :grobengineerings, :status_beschriftungsschild, :status_lettering
    rename_column :grobengineerings, :status_elektroschema, :status_electric_diag
  end
end
