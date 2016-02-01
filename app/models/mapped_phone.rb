class MappedPhone < ActiveRecord::Base
  belongs_to :phone_number
  belongs_to :mapping
end
