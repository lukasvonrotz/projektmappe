class CreateIosignalenginfos < ActiveRecord::Migration[5.0]
  def change
    create_table :iosignalenginfos do |t|
      t.text :pendenz
      t.datetime :pendenz_datum
      t.string :pendenz_wer
      t.text :pendenz_antwort
      t.datetime :pendenz_antwort_datum
      t.string :pendenz_antwort_wer

      t.text :frage
      t.datetime :frage_datum
      t.string :frage_wer
      t.text :frage_antwort
      t.datetime :frage_antwort_datum
      t.string :frage_antwort_wer

      t.text :sw_instruction
      t.datetime :sw_instruction_datum
      t.string :sw_instruction_wer
      t.text :sw_instruction_antwort
      t.datetime :sw_instruction_antwort_datum
      t.string :sw_instruction_antwort_wer

      t.timestamps
    end
    add_reference :iosignalenginfos, :iosignal, index: true, foreign_key: true, null: false
  end
end
