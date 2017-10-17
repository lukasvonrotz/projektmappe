class CreateWires < ActiveRecord::Migration[5.0]
  def change
    create_table :wires do |t|
      t.integer :aderbeschriftung, :default => 0, null: false
      t.integer :anzahladern, :default => 0, null: false
      t.string :kabeltyp

      t.timestamps
    end
    add_index :wires, :kabeltyp, :unique => true, :name => 'wires_kabeltyp_unique'
  end
end
