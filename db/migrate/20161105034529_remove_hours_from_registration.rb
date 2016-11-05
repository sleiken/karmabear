class RemoveHoursFromRegistration < ActiveRecord::Migration[5.0]
  def change
    remove_column :registrations, :hours, :integer
  end
end
