class User < ActiveRecord::Base
  has_many :DinnerPlates
  has_many :BreakfastPlates
  has_one :RecurringBreakfastPlate
  has_one :RecurringDinnerPlate
end
