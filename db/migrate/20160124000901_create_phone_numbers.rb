class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.boolean :ours
      t.references :customer, index: true, foreign_key: true
      t.text :our_metadata
      t.text :customer_metadata

      t.timestamps null: false
    end
  end
end
