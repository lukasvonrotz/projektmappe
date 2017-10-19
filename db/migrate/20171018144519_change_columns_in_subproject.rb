class ChangeColumnsInSubproject < ActiveRecord::Migration[5.0]
  def change
    add_column :subprojects, :trennzeichen, :string
    add_column :subprojects, :max_zeichen_klartext_grobeng, :integer, :default => 20, null: false
    add_column :subprojects, :max_zeichen_klartext_signal, :integer, :default => 20, null: false
    add_column :subprojects, :info1_text, :string, :default => 'Freie Beschreibung 1'
    add_column :subprojects, :info2_text, :string, :default => 'Freie Beschreibung 2'
    add_column :subprojects, :info3_text, :string, :default => 'Freie Beschreibung 3'
    add_column :subprojects, :info4_text, :string, :default => 'Freie Beschreibung 4'
    add_column :subprojects, :info5_text, :string, :default => 'Freie Beschreibung 5'
  end
end
