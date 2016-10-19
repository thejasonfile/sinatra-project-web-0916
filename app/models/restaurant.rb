class Restaurant < ActiveRecord::Base
  has_many :restaurant_users
  has_many :users, through: :restaurant_users

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Restaurant.all.find {|restaurant| restaurant.slug == slug}
  end
end
