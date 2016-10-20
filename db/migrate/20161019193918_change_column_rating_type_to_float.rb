class ChangeColumnRatingTypeToFloat < ActiveRecord::Migration
  def change
    change_column :restaurants, :rating, :float
  end
end
