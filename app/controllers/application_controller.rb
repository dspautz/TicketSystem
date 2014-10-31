class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json
  
  def index
  end

  
  def sign_in
    @user = User.find_by username: params[:username], password: params[:password]
    if @user
      p @user.username
      p @user.password
    else
      p "Kein Benutzer mit dem #{params[:username]} gefunden!"
    end
    respond_with @user
  end
  
  def sign_out
    
  end
  
end
