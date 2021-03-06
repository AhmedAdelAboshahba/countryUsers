class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.float :parcel_weight
      t.string :phone_number
      t.string :country
    end
    add_index :users, :country
  end
end
