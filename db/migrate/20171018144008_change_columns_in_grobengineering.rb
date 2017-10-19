class ChangeColumnsInGrobengineering < ActiveRecord::Migration[5.0]
  def change
    add_column :grobengineerings, :tag_anlage, :string
    add_column :grobengineerings, :tag_objekt, :string
    add_column :grobengineerings, :tag_nummer, :string
    add_column :grobengineerings, :brake, :string
    remove_column :grobengineerings, :tagnr, :string
    remove_column :grobengineerings, :tagname, :string
    rename_column :grobengineerings, :bezeichnung, :klartext
  end
end
