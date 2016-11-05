class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string   :name, null: false
      t.text     :description
      t.datetime :start
      t.datetime :end
      t.integer  :givers_needed

      t.integer  :charity_id

      t.timestamps
    end
  end
end
