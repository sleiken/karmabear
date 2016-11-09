class ChangeTypeToAction < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :type, :integer
    add_column :notifications, :action, :integer 
  end
end
