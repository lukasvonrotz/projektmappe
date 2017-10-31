class AddColumnsToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_column :grobengineerings, :hw_device_supplier, :string
    add_column :grobengineerings, :hw_device_type, :string
    add_column :grobengineerings, :hw_device_type_nr, :string
    add_column :grobengineerings, :motor_speed, :float, :default => 0, null: false
    add_column :grobengineerings, :motor_cosphi, :float, :default => 0, null: false
    add_column :grobengineerings, :motor_anschluss, :string
    add_column :grobengineerings, :motor_drehzahlgeber_fu, :string
    add_column :grobengineerings, :standort, :string
    add_column :grobengineerings, :montagephase, :string
    add_column :grobengineerings, :bmk_anlage, :string
    add_column :grobengineerings, :bmk_ort, :string
    add_column :grobengineerings, :bmk_nummer, :string
    add_column :grobengineerings, :status_beschriftungsschild, :integer, :default => 0, null: false
    add_column :grobengineerings, :status_elektroschema, :integer, :default => 0, null: false
    add_column :grobengineerings, :history, :text
  end
end
