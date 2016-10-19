class User < ActiveRecord::Base
  has_many :restaurant_users
  has_many :restaurants, through: :restaurant_users

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|restaurant| restaurant.slug == slug}
  end

end
