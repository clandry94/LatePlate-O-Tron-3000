class Plate < ActiveRecord::Base
  validates :name, :meal, :presence => true
  validates :request_day, timeliness: { on_or_after: lambda { Date.current }, type: :date}

  def new
    @plate = Plate.new
  end



end
