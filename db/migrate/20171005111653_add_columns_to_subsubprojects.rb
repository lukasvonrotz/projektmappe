class AddColumnsToSubsubprojects < ActiveRecord::Migration[5.0]
  def change
    add_column :subsubprojects, :email, :string
  end
end
