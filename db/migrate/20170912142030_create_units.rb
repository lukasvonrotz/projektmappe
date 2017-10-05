class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name

      t.timestamps
    end
    add_reference :units, :subsystem, index: true, foreign_key: true, null: false
  end
end
