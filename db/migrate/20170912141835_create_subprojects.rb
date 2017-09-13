class CreateSubprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :subprojects do |t|
      t.string :name

      t.timestamps
    end
    add_reference :subprojects, :project, index: true, foreign_key: true
    add_reference :subprojects, :customer, index: true, foreign_key: true
  end
end
