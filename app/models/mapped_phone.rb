class MappedPhone < ActiveRecord::Base
  belongs_to :phone_numbers
  belongs_to :mappings
end
