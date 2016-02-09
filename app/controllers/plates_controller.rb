class PlatesController < ApplicationController

  def index
      @plate = Plate.new
      @plates = Plate.all
      names = Name.all
      @full_names = []
      names.each do |name|
        @full_names.push(name.full_name)
      end
      @id = params[:id]
  end

  def create
      @plate = Plate.create(post_params)
      redirect_to plates_path
  end

  def delete_entry()
    @plate = Plate.destroy(@id)
    redirect_to plates_path
  end

  private

  def post_params
    params.require(:plate).permit(:name, :meal, :request_day)
  end
end
