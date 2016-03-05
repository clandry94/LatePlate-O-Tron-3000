class BreakfastplatesController < ApplicationController
  def create
    @breakfast_plate = BreakfastPlate.new(breakfast_params)
    @breakfast_plate.user_id = current_user.id

    if Date.yesterday > @breakfast_plate.request_day
      flash[:danger] = 'Please select a day after ' + Date.yesterday.to_s
      redirect_to manage_plates_path
    elsif @breakfast_plate.save
      flash[:success] = 'A breakfast plate has been reserved for you on ' +
                        @breakfast_plate.request_day.strftime("%m-%d-%Y") + '.'
      redirect_to manage_plates_path
    end
  end

  def destroy
    BreakfastPlate.destroy(params[:id])
    redirect_to manage_plates_path
  end

  private

  def breakfast_params
    params.require(:breakfast_plate).permit(:user_id, :request_day)
  end

end
