class ChangeGidToFbid < ActiveRecord::Migration[5.0]
  def change
    remove_column :givers, :gid, :string
    add_column :givers, :fbid, :string 
  end
end
