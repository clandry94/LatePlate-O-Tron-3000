class CreateRecurringPlates < ActiveRecord::Migration
  def change
    create_table :recurring_plates do |t|
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.integer :plate_id

      t.timestamps null: false
    end
  end
end
