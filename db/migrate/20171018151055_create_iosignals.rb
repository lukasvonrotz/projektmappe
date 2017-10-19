class CreateIosignals < ActiveRecord::Migration[5.0]
  def change
    create_table :iosignals do |t|
      t.string :tagname_suffix
      t.string :pendenz
      t.text :signal_beschreibung
      t.string :signal_phys
      t.string :signal_dig_aktiv_text
      t.float :signal_ana_range_min, :default => 0, null: false
      t.float :signal_ana_range_max, :default => 0, null: false
      t.integer :signal_ana_range_decimals, :default => 0, null: false
      t.string :signal_ana_range_unit, :default => ''
      t.integer :bus, :default => 0, null: false
      t.integer :di, :default => 0, null: false
      t.integer :do, :default => 0, null: false
      t.integer :ai, :default => 0, null: false
      t.integer :ao, :default => 0, null: false
      t.integer :z, :default => 0, null: false
      t.integer :inkr, :default => 0, null: false
      t.integer :ssi, :default => 0, null: false
      t.integer :safety, :default => 0, null: false
      t.integer :ex, :default => 0, null: false
      t.string :sicherheitsgruppe
      t.string :info1
      t.string :info2
      t.string :info3
      t.string :info4
      t.string :info5

      t.string :sw_datentyp
      t.string :sw_event_message
      t.string :sw_event_prio
      t.string :sw_event_normal_state
      t.string :sw_trend

      t.string :sw_info1
      t.string :sw_info2
      t.string :sw_info3

      t.belongs_to :iochannel, index: true

      t.timestamps
    end
  end
end
