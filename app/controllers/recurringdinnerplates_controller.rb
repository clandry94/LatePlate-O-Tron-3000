class RecurringdinnerplatesController < ApplicationController
  def create
    @recurring_dinner_plate = RecurringDinnerPlate.new(recurring_dinner_params).save
    redirect_to users_path
  end

  private

  def recurring_dinner_params
    params.require(:recurring_dinner_plate).permit(:user_id, :monday, :tuesday, :wednesday, :thursday, :friday)
  end
end
