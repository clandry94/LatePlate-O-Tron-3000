class PlatesController < ApplicationController
  def index
      @plate = Plate.new
  end
end
