class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :second_name
      t.string :string
      t.string :password
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
