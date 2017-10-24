class CreateSwitchgears < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgears do |t|
      t.string :kennung
      t.text :leistung
      t.float :maxstrom, :default => 0, null: false
      t.integer :typ, :default => 0, null: false

      t.timestamps
    end
    add_index :switchgears, :kennung, :unique => true, :name => 'switchgears_kennung_unique'
  end
end
