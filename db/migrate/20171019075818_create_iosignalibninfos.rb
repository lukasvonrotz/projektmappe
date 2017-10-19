class CreateIosignalibninfos < ActiveRecord::Migration[5.0]
  def change
    create_table :iosignalibninfos do |t|
      t.string :signaltest_feld
      t.string :signaltest_sw
      t.string :signaltest_hmi
      t.string :signaltest_event
      t.datetime :signaltest_ok_datum
      t.string :signaltest_ok_wer
      t.text :bemerkungen
      t.text :todo

      t.timestamps
    end
    add_reference :iosignalibninfos, :iosignal, index: true, foreign_key: true, null: false
  end
end
