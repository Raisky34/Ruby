class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.references :plane, foreign_key: true
      t.references :airport_from, foreign_key: { to_table: :airports }
      t.references :airport_to, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
