class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  post '/users' do
    binding.pry
    user = User.create(params)
    redirect "users/#{user.slug}"
  end

  get '/users/new' do
    erb  :'users/new'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(params[:user])
    redirect "users/#{user.slug}"
  end

  delete '/users/:id/delete' do
    user = User.find(params[:id])
    user.destroy
    redirect '/users'
  end

end
