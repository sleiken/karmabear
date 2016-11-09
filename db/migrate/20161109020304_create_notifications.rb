class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :giver_id
      t.integer :type

      t.timestamps
    end
  end
end
