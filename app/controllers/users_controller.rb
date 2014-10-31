class UsersController < ApplicationController
  respond_to :json
  
  def index
    @users = User.all
    @users.each do |user|
      p user
    end
    respond_with @users
  end
  
  def show
    @user =  User.find(params[:id])
    p @user
    respond_with @user
  end
  
  def create
  
  end
  
  # Bug in Angular Rails Route ???
  # Not RESTful
  def search_by_user_id
    p "Search-Params: #{params}"  
    @user = User.find(params[:user_id])
    p @user
    respond_with @user
  end
end
