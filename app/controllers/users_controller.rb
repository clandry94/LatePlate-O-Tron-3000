include UsersHelper

class UsersController < ApplicationController
  before_action :logged_in, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def manage_plates
    @breakfast_plate = BreakfastPlate.new
    @dinner_plate = DinnerPlate.new
    @recur_breakfast_plate = RecurringBreakfastPlate.new
    @recur_dinner_plate = RecurringDinnerPlate.new

    @breakfast_plates = BreakfastPlate.where(user_id: current_user.id)
    @dinner_plates = DinnerPlate.where(user_id: current_user.id)
    # @recurring_breakfast_plates = RecurringBreakfastPlate.all
    # @recurring_dinner_plates = RecurringDinnerPlate.all

    # @users = User.all
  end

  def create
    @user = User.new(user_params)

    if User.where(email_address: @user.email_address).blank?
      if @user.save
        init_recur_plates @user
        log_in @user
        flash[:success] = 'Welcome to the LatePlate-o-Tron 3000!'
        redirect_to user_url(@user) # handle successful signup
      else
        render 'new'
      end
    elsif !User.where(email_address: @user.email_address).blank?
      flash[:danger] = 'A user with this email address already exists!'
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
    @breakfast_plates = BreakfastPlate.where(user_id: current_user.id)
    @dinner_plates = DinnerPlate.where(user_id: current_user.id)
    @recur_breakfast_plates = RecurringBreakfastPlate.where(user_id: current_user.id)
    @recur_dinner_plates = RecurringDinnerPlate.where(user_id: current_user.id)
    # byebug
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address,
                                 :phone_number, :password, :password_confirmation)
  end

  def logged_in
    unless logged_in?
      flash[:danger] = 'You must be logged in to do that'
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
