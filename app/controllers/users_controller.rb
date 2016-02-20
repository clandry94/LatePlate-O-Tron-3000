class UsersController < ApplicationController

  def index
    @breakfast_plate = BreakfastPlate.new
    @dinner_plate = DinnerPlate.new
    @recurring_breakfast_plate = RecurringBreakfastPlate.new
    @recurring_dinner_plate = RecurringDinnerPlate.new

    @breakfast_plates = BreakfastPlate.all
    @dinner_plates = DinnerPlate.all
    @recurring_breakfast_plates = RecurringBreakfastPlate.all
    @recurring_dinner_plates = RecurringDinnerPlate.all

    @users = User.all
    @full_names = []
    @users.each do |user|
      @full_names.push(user.full_name)
    end
  end


end
