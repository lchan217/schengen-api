class AddTimePassedToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :time_passed, :integer
  end
end
