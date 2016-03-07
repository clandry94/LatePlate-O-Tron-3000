require_relative '../../config/environment.rb'
require_relative 'name'
require 'date'

class SmsBuilder
  attr_accessor :date, :message

  def initialize date, meal
    @date = date # Date.today # Time.new.hour
    names = retrieve_names(meal)
    @message = build_message(meal, names)
  end

  # Create the message to be sent.
  # Returns message based on the meal param
  def build_message(meal, names)
    if meal == 0
      message = "Breakfast: \n" + names
      return message
    elsif meal == 1
      message = "Dinner: \n" + names
      return message
    else
      message = "ERROR, please message Conor for manual override."
      return message
    end
  end

  private

  # Connects to the database and retrieve the breakfast plates and dinner plates
  # saved using ActiveRecord.
  # Returns names for breakfast plate or dinner plate based on the meal param
  def retrieve_names(meal)
    @names = ''
    begin
      if meal == 0
        breakfast_plates = BreakfastPlate.all
        breakfast_plates.each do |plate|
          if plate.request_day == @date
            user =  User.where(id: plate.user_id)
            name = Name.new(user[0]['first_name'], user[0]['last_name'])
            @names << name.first_name + ' ' + name.last_name + " \n"
          end
        end
        return @names
      elsif meal == 1
        dinner_plates = DinnerPlate.all
        dinner_plates.each do |plate|
          if plate.request_day == @date
            user =  User.where(id: plate.user_id)
            name = Name.new(user[0]['first_name'], user[0]['last_name'])
            @names << name.first_name + ' ' + name.last_name + " \n"
          end
        end
        return @names
      else
        return "Error, invalid meal"
      end
    rescue => ex
      return "Error, #{ex.message}"
    end
  end
end
