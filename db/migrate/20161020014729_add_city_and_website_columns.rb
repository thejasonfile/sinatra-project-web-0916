class AddCityAndWebsiteColumns < ActiveRecord::Migration
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :url, :string
  end
end
