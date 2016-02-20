class BreakfastplatesController < ApplicationController

  def index

  end

  def create
    @breakfast_plate = BreakfastPlate.new(breakfast_params).save
    redirect_to users_path
  end

  private

  def breakfast_params
    params.require(:breakfast_plate).permit(:user_id, :request_day)
  end
end
