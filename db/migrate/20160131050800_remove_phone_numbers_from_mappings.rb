class RemovePhoneNumbersFromMappings < ActiveRecord::Migration
  def change
    remove_column :mappings, :incoming_phone_number_id, :integer
    remove_column :mappings, :phone_number_id, :integer
  end
end
