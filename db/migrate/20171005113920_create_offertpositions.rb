class CreateOffertpositions < ActiveRecord::Migration[5.0]
  def change
    create_table :offertpositions do |t|
      t.string :name


      t.timestamps
    end
    add_reference :offertpositions, :subsubproject, index: true, foreign_key: true, null: false
  end
end
