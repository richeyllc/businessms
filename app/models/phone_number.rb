class PhoneNumber < ActiveRecord::Base
  belongs_to :customer

  before_create :add_plus1
  before_update :add_plus1

  def add_plus1
    # we need to add +1 to the beginning of the phone number. 
    self.number = "+1" + self.number
  end
end
