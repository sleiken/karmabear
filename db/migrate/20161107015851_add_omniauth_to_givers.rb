class AddOmniauthToGivers < ActiveRecord::Migration[5.0]
  def change
    add_column :givers, :provider, :string
    add_column :givers, :gid, :string
  end
end
