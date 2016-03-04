class UsersController < ApplicationController

  def index
    @breakfast_plate = BreakfastPlate.new
    @dinner_plate = DinnerPlate.new
    @recurring_breakfast_plate = RecurringBreakfastPlate.new
    @recurring_dinner_plate = RecurringDinnerPlate.new

    @breakfast_plates = BreakfastPlate.all
    @dinner_plates = DinnerPlate.all
    @recurring_breakfast_plates = RecurringBreakfastPlate.all
    @recurring_dinner_plates = RecurringDinnerPlate.all

    @users = User.all
    @full_names = []
    @users.each do |user|
      @full_names.push(user.full_name)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the LatePlate-o-Tron 3000!"
      redirect_to user_url(@user) #handle successful signup
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
    #byebug
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address,
                                    :phone_number, :password, :password_confirmation, )
    end


end
