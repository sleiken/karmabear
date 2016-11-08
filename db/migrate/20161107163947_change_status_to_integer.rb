class ChangeStatusToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :needs, :status
    add_column :needs, :status, :integer, default: 1
  end
end
