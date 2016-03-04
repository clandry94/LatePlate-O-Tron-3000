class UsersController < ApplicationController
  before_action :logged_in, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  # def index
  #   @breakfast_plate = BreakfastPlate.new
  #   @dinner_plate = DinnerPlate.new
  #   @recurring_breakfast_plate = RecurringBreakfastPlate.new
  #   @recurring_dinner_plate = RecurringDinnerPlate.new

  #   @breakfast_plates = BreakfastPlate.all
  #   @dinner_plates = DinnerPlate.all
  #   @recurring_breakfast_plates = RecurringBreakfastPlate.all
  #   @recurring_dinner_plates = RecurringDinnerPlate.all

  #   @users = User.all
  #   @full_names = []
  #   @users.each do |user|
  #     @full_names.push(user.full_name)
  #   end
  # end

  def index
    @users = User.paginate(page: params[:page])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address,
                                    :phone_number, :password, :password_confirmation, )
    end

    def logged_in
      unless logged_in?
        flash[:danger] = "You must be logged in to do that"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
