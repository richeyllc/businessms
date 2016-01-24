class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :business_name
      t.string :stripe_id
      t.string :uuid

      t.timestamps null: false
    end
  end
end
