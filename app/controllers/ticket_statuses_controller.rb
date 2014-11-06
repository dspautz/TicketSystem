class TicketStatusesController < ApplicationController
  respond_to :json
  
  def index
    @ticket_statuses = TicketStatus.all
    respond_with @ticket_statuses
  end

  def create
    p "Params: #{params}"
    respond_with TicketStatus.create ticket_status_params
  end

  def destroy
    p "Destroy-Prarams: #{params}"
    respond_with TicketStatus.destroy params[:id]
  end

  def update
    p "Params: #{params}"
  end
  
  def show
    p "Params: #{params}"
    respond_with TicketStatus.find(params[:id])
  end
  
  
  private
  
  def ticket_status_params
    params.require(:ticket_status).permit(:text)
  end
 
end
