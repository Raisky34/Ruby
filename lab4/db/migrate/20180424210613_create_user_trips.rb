class CreateUserTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trips, :users do |t|
      t.index %i[trip_id user_id]
    end
  end
end
