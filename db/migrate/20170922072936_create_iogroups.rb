class CreateIogroups < ActiveRecord::Migration[5.0]
  def change
    create_table :iogroups do |t|
      t.string :name
      t.string :profibus_address

      t.timestamps
    end
    add_reference :iogroups, :switchgearcombination, index: true, foreign_key: true, null: false
  end
end
