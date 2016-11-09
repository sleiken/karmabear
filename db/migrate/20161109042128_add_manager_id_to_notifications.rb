class AddManagerIdToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :manager_id, :integer
  end
end
