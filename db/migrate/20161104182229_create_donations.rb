class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :quantity_given, default: 0

      t.integer :need_id
      t.integer :giver_id

      t.timestamps
    end
  end
end
