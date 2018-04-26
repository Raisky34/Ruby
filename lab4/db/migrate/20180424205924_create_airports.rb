class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.belongs_to :country, foreign_key: true

      t.timestamps
    end
  end
end
