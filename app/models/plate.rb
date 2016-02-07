class Plate < ActiveRecord::Base
  def new
    @plate = Plate.new
  end
end
