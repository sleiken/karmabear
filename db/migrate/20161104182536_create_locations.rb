class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string  :name,     null: false
      t.string  :lat,      null: false
      t.string  :lng,      null: false
      t.integer :giver_id, null: false

      t.timestamps
    end
  end
end
