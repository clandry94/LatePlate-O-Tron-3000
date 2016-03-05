class RecurringdinnerplatesController < ApplicationController
  def create
    def create
      @recur_dinner_plate = RecurringDinnerPlate.new(recur_dinner_params)
      @recur_dinner_plate.user_id = current_user.id

      if @recur_dinner_plate.save
        flash[:sucess] = 'Your recurring dinner options have been saved.'
        redirect_to manage_plates_path
      else
        flash[:danger] = 'An error has occurred, please try again.'
        redirect_to manage_plates_path
      end
    end

  end

  private

  def recur_dinner_params
    params.permit(:user_id, :monday, :tuesday, :wednesday, :thursday, :friday)
  end
end
