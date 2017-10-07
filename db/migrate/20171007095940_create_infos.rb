class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.datetime :datum
      t.text :quelle
      t.text :info
      t.text :querverweis

      t.timestamps
    end
    add_reference :infos, :subproject, index: true, foreign_key: true, null: false
  end
end
