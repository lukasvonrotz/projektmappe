class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.datetime :datum
      t.text :ereignis

      t.timestamps
    end
    add_reference :histories, :subproject, index: true, foreign_key: true, null: false
  end
end
