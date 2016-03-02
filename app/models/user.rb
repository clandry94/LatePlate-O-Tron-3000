class User < ActiveRecord::Base
  validates :full_name, :presence => true
  has_many :DinnerPlates
  has_many :BreakfastPlates
  has_one :RecurringBreakfastPlate
  has_one :RecurringDinnerPlate
end
