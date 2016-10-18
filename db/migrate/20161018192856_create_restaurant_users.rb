class CreateRestaurantUsers < ActiveRecord::Migration
  def change
    create_table :restaurant_users do |t|
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
