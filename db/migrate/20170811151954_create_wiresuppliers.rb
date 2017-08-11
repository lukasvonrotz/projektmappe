class CreateWiresuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :wiresuppliers do |t|
      t.string :name

      t.timestamps
    end
  end
end
