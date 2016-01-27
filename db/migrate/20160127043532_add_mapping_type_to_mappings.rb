class AddMappingTypeToMappings < ActiveRecord::Migration
  def change
    add_reference :mappings, :mapping_type, index: true, foreign_key: true
    add_column :mappings, :external_function, :text
    add_column :mappings, :hours_url, :text
    add_column :mappings, :location, :text
    add_column :mappings, :call_back_info, :text
  end
end
