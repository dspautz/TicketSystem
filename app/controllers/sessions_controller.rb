class SessionsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      #redirect_to root_url, :notice => "Logged in!"
    else
      #flash.now.alert = "Invalid email or password"
      #render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    #redirect_to root_url, :notice => "Logged out!"
  end

end
