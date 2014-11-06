class RolesController < ApplicationController
  respond_to :json
  
  def index
    @roles = Role.all
    respond_with @roles
  end
  
  def create
    p "Create Params: #{params}"
    respond_with Role.create(role_params)
  end

  def destroy
    p "Destroy-Prarams: #{params}"
    respond_with Role.destroy params[:id]
  end
  
    private
  
  def role_params
    params.require(:role).permit(:rolename, :admin)
  end
 
  
 
end
