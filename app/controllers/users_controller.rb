class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  post '/users' do
    user = User.create(params)
    redirect "users/#{user[:id]}"
  end

  get '/users/new' do
    erb  :'users/new'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  post '/users/:id' do
    user = User.find(params[:id])
    user.update(params[:user])
    redirect "users/#{user[:id]}"
  end


end
