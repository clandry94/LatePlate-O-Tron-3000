class RemoveRequestDayFromPlates < ActiveRecord::Migration
  def self.up
    remove_column :plates, :request_day
  end
end
