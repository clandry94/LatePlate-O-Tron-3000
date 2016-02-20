class DinnerplatesController < ApplicationController

  def create
    @dinner_plate = DinnerPlate.new(dinner_params).save
    redirect_to users_path
  end

  private

  def dinner_params
    params.require(:dinner_plate).permit(:user_id, :request_day)
  end
end
