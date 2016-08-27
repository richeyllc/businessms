class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :customers_users
  has_many :customers, through: :customers_users
  belongs_to :user_type

  def has_role?(role)
    if user_type.name == role
      true
    else
      false
    end
  end

end
