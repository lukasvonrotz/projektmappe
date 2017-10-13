class CreateOfferOffertpositions < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_offertpositions do |t|
      t.integer :offer_id, null: false
      t.integer :offertposition_id, null: false
      t.float :device_anzahl, :default => 0, null: false
      t.float :eng_elplanung, :default => 0, null: false
      t.float :eng_planung_sw, :default => 0, null: false
      t.float :eng_ibn_bauleitung, :default => 0, null: false
      t.float :sps_total_brutto, :default => 0, null: false
      t.float :sps_total_netto, :default => 0, null: false
      t.float :io_et_total_brutto, :default => 0, null: false
      t.float :io_et_total_netto, :default => 0, null: false
      t.float :io_pilz_total_brutto, :default => 0, null: false
      t.float :io_pilz_total_netto, :default => 0, null: false
      t.float :fu_total_brutto, :default => 0, null: false
      t.float :fu_total_netto, :default => 0, null: false
      t.float :sch_total_brutto, :default => 0, null: false
      t.float :sch_total_netto, :default => 0, null: false
      t.float :elinst_total_brutto, :default => 0, null: false
      t.float :elinst_total_netto, :default => 0, null: false
      t.float :elinst_total_brutto, :default => 0, null: false
      t.float :elinst_total_netto, :default => 0, null: false

      t.timestamps
    end
    add_index :offer_offertpositions, [:offer_id, :offertposition_id], :unique => true, :name => 'offer_offertposition_unique'
  end
end
