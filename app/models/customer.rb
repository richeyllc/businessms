class Customer < ActiveRecord::Base
  has_many :phone_numbers
  has_many :mappings
  has_many :customers_users
  has_many :users, through: :customers_users

  before_save :create_uuid

  def create_uuid
    if self.uuid.blank?
      self.uuid = SecureRandom.uuid
    end
  end

  def get_mapping_from_message(message)
    self.mappings.find_by(received_text: message).reply_text
  end
end
