class CreateCustomersUsers < ActiveRecord::Migration
  def change
    create_table :customers_users do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
