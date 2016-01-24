class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :phone_number, index: true, foreign_key: true
      t.references :incoming_phone_number, index: true, foreign_key: true
      t.string :received_text
      t.string :reply_text

      t.timestamps null: false
    end
  end
end
