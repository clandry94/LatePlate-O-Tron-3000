class User < ActiveRecord::Base
  attr_accessor :remember_token

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { self.email_address = email_address.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, format: { with: EMAIL_REGEX, on: :create }
  validates :phone_number, presence: true
  # validate :check_password_equals_confirmation  # doesn't allow profile updates, look into this

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  has_many :DinnerPlates
  has_many :BreakfastPlates
  has_one :RecurringBreakfastPlate
  has_one :RecurringDinnerPlate

  def check_password_equals_confirmation
    if password != password_confirmation
      errors.add(:password, 'Is not equal to password confirmation!')
    end
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets the current user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
