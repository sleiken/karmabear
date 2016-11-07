class AddImageUrlToGivers < ActiveRecord::Migration[5.0]
  def change
    add_column :givers, :image_url, :string
  end
end
