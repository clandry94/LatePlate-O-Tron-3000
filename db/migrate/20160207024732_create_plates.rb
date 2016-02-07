class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :name
      t.string :meal
      t.date :request_day

      t.timestamps null: false
    end
  end
end
