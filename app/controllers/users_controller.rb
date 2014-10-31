class UsersController < ApplicationController
  respond_to :json
  
  def index
    p "Params: #{params}"
    @users = User.all
    @users.each do |user|
      p user
    end
    respond_with @users
  end
  
  def show
    p "Show Params: #{params}"
    @user =  User.find(params[:id])
    p @user
    respond_with @user
  end
  
  def create
  end
end
