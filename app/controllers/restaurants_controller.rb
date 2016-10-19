require 'pry'

class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    # binding.pry
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
    location = params[:city]
    food = params[:cuisine]
    YelpApi.search(location,{term: food})
    redirect "/restaurants/results"
  end

  get '/restaurants/results' do
    @results = Restaurant.find_by_sql('select name, id from restaurants order by id Desc limit 20')
    erb :'restaurants/results'
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
