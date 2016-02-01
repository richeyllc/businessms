class Mapping < ActiveRecord::Base
  belongs_to :customer
  belongs_to :mapping_type
  has_many :mapped_phones
  has_many :phone_numbers, through: :mapped_phones
end
