class AddHerstellerToAssemblies < ActiveRecord::Migration[5.0]
  def change
    add_column :assemblies, :hersteller, :string
  end
end
