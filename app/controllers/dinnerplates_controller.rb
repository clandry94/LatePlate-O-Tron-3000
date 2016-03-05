class DinnerplatesController < ApplicationController
    def create
      @dinner_plate = DinnerPlate.new(dinner_params)
      @dinner_plate.user_id = current_user.id

      if Date.yesterday > @dinner_plate.request_day
        flash[:danger] = 'Please select a day after ' + Date.yesterday.to_s
        redirect_to manage_plates_path
      elsif @dinner_plate.request_day.wday == 6 || @dinner_plate.request_day.wday == 0
        flash[:danger] = 'Dinner is only served on weekdays. Please try again.'
        redirect_to manage_plates_path
      elsif @dinner_plate.save
        flash[:success] = 'A dinner plate has been reserved for you on ' +
                          @dinner_plate.request_day.strftime("%m-%d-%Y") + '.'
        redirect_to manage_plates_path
      end
    end

    def destroy
      DinnerPlate.destroy(params[:id])
      redirect_to manage_plates_path
    end

  private

  def dinner_params
    params.require(:dinner_plate).permit(:user_id, :request_day)
  end
end
