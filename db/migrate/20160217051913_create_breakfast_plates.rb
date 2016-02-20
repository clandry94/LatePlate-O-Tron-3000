class CreateBreakfastPlates < ActiveRecord::Migration
  def change
    create_table :breakfast_plates do |t|
      t.date :request_day
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
