class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/:id' do
    @user = User.find
  end

  post '/users' do

  end

end