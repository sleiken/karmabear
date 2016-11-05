class AddHoursToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :pending_hours, :integer
    add_column :registrations, :approved_hours, :integer
  end
end
