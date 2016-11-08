class RemoveColumnFromDonations < ActiveRecord::Migration[5.0]
  def change
    remove_column :donations, :quantity_given, :integer
  end
end
