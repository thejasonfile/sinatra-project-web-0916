class AddAddressAndRatingToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating, :integer
    add_column :restaurants, :address, :string
  end
end
