class RequestsController < ApplicationController
  respond_to :json
  
  def index
    @requests = Request.all
    @requests.each do |request|
      p request
    end
    respond_with @requests
  end

  def create
    p "Params: #{params}"
  end

  def destroy
    p "Prarams: #{params}"
  end

  def update
    p "Params: #{params}"
  end
  
   def search_by_ticket_id
    p "Search-Params: #{params}"
    
    @requests = Request.where(ticket_id: params[:ticket_id])
    p @requests
    respond_with @requests
  end
end
