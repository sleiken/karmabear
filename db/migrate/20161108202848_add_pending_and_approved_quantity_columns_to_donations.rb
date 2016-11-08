class AddPendingAndApprovedQuantityColumnsToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :quantity_pending, :integer, default: 0
    add_column :donations, :quantity_approved, :integer, default: 0
  end
end
