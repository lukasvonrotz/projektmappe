class AddAttributesToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_column :subsubprojects, :eurokurs, :float
    add_column :subsubprojects, :proiorechnen, :boolean

    add_reference :subsubprojects, :wiresupplier, index: true
    add_reference :subsubprojects, :wirecaptionsupplier, index: true

    add_foreign_key :subsubprojects, :suppliers, column: :wiresupplier_id
    add_foreign_key :subsubprojects, :suppliers, column: :wirecaptionsupplier_id
  end
end
