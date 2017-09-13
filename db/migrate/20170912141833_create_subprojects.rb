class CreateSubprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :subprojects do |t|
      t.string :name
      t.boolean :master

      t.timestamps
    end
  end
end
