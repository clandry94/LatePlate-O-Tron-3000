class UsersController < ApplicationController

  def index
    @breakfast_plate = BreakfastPlate.new
    @dinner_plate = DinnerPlate.new

    @breakfast_plates = BreakfastPlate.all
    @dinner_plates = DinnerPlate.all

    @users = User.all
    @full_names = []
    @users.each do |user|
      @full_names.push(user.full_name)
    end
  end


  private

  def post_params
    #params.require(:plate).permit(:name, :meal, :request_day)
  end
end
