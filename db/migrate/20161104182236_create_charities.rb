class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.string  :name,    null: false
      t.string  :lat,     null: false
      t.string  :lng,     null: false
      t.string  :address, array: true, null: false
      t.text    :description
      t.string  :phone
      t.string  :url

      t.integer :manager_id

      t.timestamps
    end
  end
end
