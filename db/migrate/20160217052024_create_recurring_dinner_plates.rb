class CreateRecurringDinnerPlates < ActiveRecord::Migration
  def change
    create_table :recurring_dinner_plates do |t|
      t.integer :user_id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday

      t.timestamps null: false
    end
  end
end
