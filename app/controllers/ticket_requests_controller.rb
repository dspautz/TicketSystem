class TicketRequestsController < ApplicationController
  respond_to :json
  before_filter :beforeFilter
  
  def index
    @ticket_requests = TicketRequest.all
    respond_with @ticket_requests
  end

  def create
    p "Params: #{params}"
    #respond_with TicketRequest.create ticket_request_params
    
    @ticket_request = TicketRequest.new
    @ticket_request.ticket_id = params[:ticket_request][:ticket_id]
    @ticket_request.report = params[:ticket_request][:report]
    @ticket_request.save
    respond_to do |format|
      format.json { render json: @ticket_request}
    end
    #respond_with @ticket_request
  end

  def destroy
    p "Prarams: #{params}"
  end

  def update
    p "Params: #{params}"
  end
  
   def search_by_ticket_id
    p "Search-Params: #{params}"
    
    @ticket_requests = TicketRequest.where(ticket_id: params[:ticket_id])
    p @ticket_requests
    respond_with @ticket_requests
  end
  
  def show
    p "Params: #{params}"
  end
  
  
  private
  
  def ticket_request_params
    params.require(:ticket_request).permit(:report, :ticket_id)
  end
  
  def beforeFilter
    # Used by Mailer to generate dynamic absolute ticket URL's
    $request = request
  end
end
