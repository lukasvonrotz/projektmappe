class CreateIotypes < ActiveRecord::Migration[5.0]
  def change
    create_table :iotypes do |t|
      t.string :name

      t.timestamps
    end
    add_index :iotypes, :name, :unique => true, :name => 'iotypes_name_unique'
  end
end
