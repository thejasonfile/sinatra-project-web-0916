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

  post '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.update(params[:restaurant])
    redirect "/restaurants/#{restaurant[:id]}"
  end

end
