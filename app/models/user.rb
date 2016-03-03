class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { self.email_address = email_address.downcase }

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email_address, :presence => true, format: { with: EMAIL_REGEX, on: :create }
  validates :phone_number, :presence => true
  validates :password, presence: true, length: { minimum: 8 }
  validate :check_password_equals_confirmation

  has_secure_password

  has_many :DinnerPlates
  has_many :BreakfastPlates
  has_one :RecurringBreakfastPlate
  has_one :RecurringDinnerPlate

  def check_password_equals_confirmation
    if password != password_confirmation
      errors.add(:password, "Is not equal to password confirmation!")
    end
  end


end
