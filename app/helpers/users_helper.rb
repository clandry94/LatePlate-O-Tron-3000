module UsersHelper

  # Set up two initial recurring plates for modification 
  def init_recur_plates user
    recur_breakfast_plate = RecurringBreakfastPlate.new(recur_params)
    recur_breakfast_plate.user_id = user.id
    recur_breakfast_plate.monday = false
    recur_breakfast_plate.tuesday = false
    recur_breakfast_plate.wednesday = false
    recur_breakfast_plate.thursday = false
    recur_breakfast_plate.friday = false

    recur_breakfast_plate.save

    recur_dinner_plate = RecurringDinnerPlate.new(recur_params)
    recur_dinner_plate.user_id = user.id
    recur_dinner_plate.monday = false
    recur_dinner_plate.tuesday = false
    recur_dinner_plate.wednesday = false
    recur_dinner_plate.thursday = false
    recur_dinner_plate.friday = false

    recur_dinner_plate.save
  end

  def verify_check
    true
  end
  private

  def recur_params
    params.permit(:user_id, :monday, :tuesday, :wednesday, :thursday, :friday)
  end
end
