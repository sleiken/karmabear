class ChangesLatLngColumnsToFloat < ActiveRecord::Migration[5.0]
  def change
    change_table :charities do |t|
      t.change :lat, 'float USING lat::double precision'
      t.change :lng, 'float USING lng::double precision'
    end
  end
end
