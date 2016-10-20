class RestaurantsController < ApplicationController

  get '/restaurants' do
    if params[:city] && params[:cuisine]
      @restaurants = YelpApi.search(params[:city],{term: params[:cuisine]})
    else
      @restaurants = Restaurant.all
    end
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  post '/restaurants' do
    restaurant = Restaurant.create(params)
    redirect "/restaurants/#{restaurant.slug}"
  end

  get '/restaurants/search' do
    @results= YelpApi.search(params[:city],{term: params[:cuisine]})
    erb :"/restaurants/index"
  end

  get '/restaurants/:slug' do
    @restaurant = Restaurant.find_by_slug(params[:slug])
    @valid_users = User.all - @restaurant.users
    erb :'restaurants/show'
  end

  post '/restaurants/:id/adduser' do
      restaurant = Restaurant.find(params[:id])
      user = User.find_by(name: params[:user])
      if !restaurant.users.include?(user)
        restaurant.users << user
      end
  redirect "/restaurants/#{restaurant.slug}"
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

  patch '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.update(params[:restaurant])
    redirect "/restaurants/#{restaurant.slug}"
  end

  delete '/restaurants/:id/delete' do
    restaurant = Restaurant.find(params[:id])
    restaurant.delete
    redirect '/restaurants'
  end

end
