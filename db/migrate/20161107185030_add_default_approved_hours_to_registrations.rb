class AddDefaultApprovedHoursToRegistrations < ActiveRecord::Migration[5.0]
  def change
    remove_column :registrations, :pending_hours
    remove_column :registrations, :approved_hours
    add_column :registrations, :pending_hours, :integer, default: 0
    add_column :registrations, :approved_hours, :integer, default: 0
  end
end
