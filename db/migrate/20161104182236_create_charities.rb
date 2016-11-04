class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|

      t.timestamps
    end
  end
end
