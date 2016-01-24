class Mapping < ActiveRecord::Base
  belongs_to :customer
  belongs_to :phone_number
  belongs_to :incoming_phone_number

end
