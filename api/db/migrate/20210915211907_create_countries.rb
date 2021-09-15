class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :users_count, default: 0
      t.string :code
      t.string :regex
    end
  end
end
