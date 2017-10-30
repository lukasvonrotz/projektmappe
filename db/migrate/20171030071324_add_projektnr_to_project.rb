class AddProjektnrToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :subprojects, :projektnummer_prola, :string
  end
end
