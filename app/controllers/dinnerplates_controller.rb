class DinnerplatesController < ApplicationController
    def create
      @dinner_plate = DinnerPlate.new(dinner_params)
      @dinner_plate.user_id = current_user.id

      # Check if yesterday is ahead of the requested day by the user
      # if true, make the user reselect a valid date
      # OPTIMIZE: Use built in rails validations
      if Date.yesterday > @dinner_plate.request_day
        flash[:danger] = 'Please select a day after ' + Date.yesterday.to_s
        redirect_to manage_plates_path
      # Check if the requested day is on a Saturday (6) or Sunday (0)
      # OPTIMIZE: Use built in rails validations
      elsif @dinner_plate.request_day.wday == 6 || @dinner_plate.request_day.wday == 0
        flash[:danger] = 'Dinner is only served on weekdays. Please try again.'
        redirect_to manage_plates_path
      # Otherwise, save the requested plate
      elsif @dinner_plate.save
        flash[:success] = 'A dinner plate has been reserved for you on ' +
                          @dinner_plate.request_day.strftime("%m-%d-%Y") + '.'
        redirect_to manage_plates_path
      end
    end

    # Delete a late plate by id
    def destroy
      DinnerPlate.destroy(params[:id])
      redirect_to manage_plates_path
    end

  private

  def dinner_params
    params.require(:dinner_plate).permit(:user_id, :request_day)
  end
end
