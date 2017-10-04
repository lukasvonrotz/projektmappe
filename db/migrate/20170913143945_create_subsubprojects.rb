class CreateSubsubprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :subsubprojects do |t|
      t.string :name
      t.boolean :master

      t.timestamps
    end
    add_reference :subsubprojects, :subproject, index: true, foreign_key: true, null: false
  end
end
