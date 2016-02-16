class CreateDailyPlates < ActiveRecord::Migration
  def change
    create_table :daily_plates do |t|
      t.date :request_date
      t.integer :plate_id

      t.timestamps null: false
    end
  end
end
