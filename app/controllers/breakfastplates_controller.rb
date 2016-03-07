class BreakfastplatesController < ApplicationController
  def create
    @breakfast_plate = BreakfastPlate.new(breakfast_params)
    @breakfast_plate.user_id = current_user.id

    # Check if yesterday is ahead of the requested day by the user
    # if true, make the user reselect a valid date
    # OPTIMIZE: Use built in rails validations
    if Date.yesterday > @breakfast_plate.request_day
      flash[:danger] = 'Please select a day after ' + Date.yesterday.to_s
      redirect_to manage_plates_path
    # Check if the requested day is on a Saturday (6) or Sunday (0)
    # OPTIMIZE: Use built in rails validations
    elsif @breakfast_plate.request_day.wday == 6 || @breakfast_plate.request_day.wday == 0
      flash[:danger] = 'Breakfast is only served on weekdays. Please try again.'
      redirect_to manage_plates_path
    # Otherwise, save the requested plate
    elsif @breakfast_plate.save
      flash[:success] = 'A breakfast plate has been reserved for you on ' +
                        @breakfast_plate.request_day.strftime("%m-%d-%Y") + '.'
      redirect_to manage_plates_path
    end
  end

  # Delete a late plate by id
  def destroy
    BreakfastPlate.destroy(params[:id])
    redirect_to manage_plates_path
  end

  private

  def breakfast_params
    params.require(:breakfast_plate).permit(:user_id, :request_day)
  end

end
