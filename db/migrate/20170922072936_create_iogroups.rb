class CreateIogroups < ActiveRecord::Migration[5.0]
  def change
    create_table :iogroups do |t|
      t.string :name
      t.string :profibus_address

      t.timestamps
    end
  end
end
