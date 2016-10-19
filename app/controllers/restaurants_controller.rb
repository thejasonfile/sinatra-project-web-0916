require 'pry'

class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  post '/restaurants' do
    restaurant = Restaurant.create(params)
    redirect "/restaurants/#{restaurant[:id]}"
  end

  post '/restaurants/search' do
    @yelp = Yelp.client.search(params[:city], params[:options])
    @business_info = @yelp.businesses.each_with_object(Array.new) do |business , array|
      array << business.name
      array << business.rating
      array << business.location.display_address
    end
    binding.pry
    redirect "/restaurants/:id"
  end

  get '/restaurants/:id' do
    @users = User.all
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show'
  end

  post '/restaurants/:id/adduser' do
      restaurant = Restaurant.find(params[:id])
      user = User.find_by(name: params[:user])
      restaurant.users << user
  redirect "/restaurants/#{restaurant[:id]}"
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

  patch '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.update(params[:restaurant])
    redirect "/restaurants/#{restaurant[:id]}"
  end

  delete '/restaurants/:id/delete' do
    restaurant = Restaurant.find(params[:id])
    restaurant.delete
    redirect '/restaurants'
  end

end
