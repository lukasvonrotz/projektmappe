class AddAttributesToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_column :subsubprojects, :eurokurs, :float, :default => 1.2, null: false
    add_column :subsubprojects, :proiorechnen, :boolean, :default => false, null: false

    add_reference :subsubprojects, :wiresupplier, index: true, null: false
    add_reference :subsubprojects, :wirecaptionsupplier, index: true, null: false

    add_foreign_key :subsubprojects, :suppliers, column: :wiresupplier_id
    add_foreign_key :subsubprojects, :suppliers, column: :wirecaptionsupplier_id
  end
end
