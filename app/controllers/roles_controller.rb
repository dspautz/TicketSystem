class RolesController < ApplicationController
  respond_to :json
  
  def index
    @roles = Role.all
    respond_with @roles
  end

 
  
 
end
