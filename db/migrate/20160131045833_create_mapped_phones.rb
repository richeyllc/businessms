class CreateMappedPhones < ActiveRecord::Migration
  def change
    create_table :mapped_phones do |t|
      t.integer :mapping_id
      t.integer :phone_number_id

      t.timestamps null: false
    end
  end
end
