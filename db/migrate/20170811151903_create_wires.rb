class CreateWires < ActiveRecord::Migration[5.0]
  def change
    create_table :wires do |t|
      t.integer :aderbeschriftung
      t.integer :anzahladern
      t.string :kabeltyp

      t.timestamps
    end
  end
end
