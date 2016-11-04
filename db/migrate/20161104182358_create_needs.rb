class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.string  :name, null: false
      t.text    :description
      t.integer :quantity_needed
      t.string  :status

      t.integer :charity_id

      t.timestamps
    end
  end
end
