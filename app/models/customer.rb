class Customer < ActiveRecord::Base
  has_many :phone_numbers
  has_many :mappings

  def get_mapping_from_message(message)
    self.mappings.find_by(received_text: message).reply_text
  end
end
