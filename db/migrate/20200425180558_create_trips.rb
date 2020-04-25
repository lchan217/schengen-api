class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :entry
      t.date :exit
      t.string :location
      t.boolean :passed

      t.timestamps
    end
  end
end
