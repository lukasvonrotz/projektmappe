class CreateWirecaptionsuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :wirecaptionsuppliers do |t|
      t.string :name
      t.float :kostenkabelmitmontagetraeger
      t.float :kostenadermitmontagehuelse

      t.timestamps
    end
  end
end
