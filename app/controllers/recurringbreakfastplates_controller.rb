class RecurringbreakfastplatesController < ApplicationController
  def create
    @recurring_breakfast_plate = RecurringBreakfastPlate.new(recurring_breakfast_params).save
    redirect_to users_path
  end

  private

  def recurring_breakfast_params
    params.require(:recurring_breakfast_plate).permit(:user_id, :monday, :tuesday, :wednesday, :thursday, :friday)
  end
end
