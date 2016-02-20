class BreakfastPlate < ActiveRecord::Base
  belongs_to :user

  def new
    @breakfast_plate = BreakfastPlate.new
  end
end
