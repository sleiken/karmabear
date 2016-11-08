class AddUniqueIndexToGiverUsername < ActiveRecord::Migration[5.0]
  def change
    add_index :givers, :username, unique: true
  end
end
