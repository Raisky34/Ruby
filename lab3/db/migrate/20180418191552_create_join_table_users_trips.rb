class CreateJoinTableUsersTrips < ActiveRecord::Migration[5.0]
    def change
        create_join_table :users, :trips do |t|
        end
    end
end
