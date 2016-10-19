class RestaurantsController < ApplicationController

  get '/restaurants' do
    if params[:city] && params[:cuisine]
      @results = YelpApi.search(params[:city],{term: params[:cuisine]})
    else
      @results = Restaurant.all
    end
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  post '/restaurants' do
    restaurant = Restaurant.create(params)
    redirect "/restaurants/#{restaurant[:id]}"
  end

  get '/restaurants/search' do
    @results= YelpApi.search(params[:city],{term: params[:cuisine]})
    erb :"/restaurants/index"
  end

  get '/restaurants/:slug' do
    @users = User.all
    @restaurant = Restaurant.find_by_slug(params[:slug])
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
