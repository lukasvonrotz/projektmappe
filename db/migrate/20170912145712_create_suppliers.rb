class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name

      t.timestamps
    end
    add_index :suppliers, :name, :unique => true, :name => 'suppliers_name_unique'
  end
end
