class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.integer :hours, default: 0

      t.integer :event_id
      t.integer :giver_id

      t.timestamps
    end
  end
end
