class TicketsController < ApplicationController
  respond_to :json
  before_filter :beforeFilter
  
  def index
    @tickets = Ticket.all
    respond_with @tickets
  end

  def create
    p "Params: #{params}"
    
    if @ticket = Ticket.create(ticket_params)
      ActiveRecord::Base.skip_send_email = true
      @ticket_request = TicketRequest.new
      @ticket_request.ticket_id=@ticket.id
      @ticket_request.report=params[:ticket][:ticket_request][:report]
      @ticket_request.save
      ActiveRecord::Base.skip_send_email = false
    end
    respond_with @ticket
  end

  def statuses
    @statuses = Ticket.statuses
    @statuses.each do |status|
      p status
    end
    respond_with @statuses
  end

  def destroy
    p "Prarams: #{params}"
    respond_with Ticket.destroy params[:id]
  end

  def update
    p "Params: #{params}"
    @ticket = Ticket.find params[:id]
    respond_with @ticket.update(ticket_params)
  end
  
  def show
    p "Show-Params: #{params}"
    if params[:ref]
      @ticket = Ticket.find_by_reference_no(params[:ref])
    else
      @ticket = Ticket.find(params[:id])
    end
    p @ticket
  end
  
   def search_by_params
    p "Search-Params: #{params}"
    
    # BAD CODE
    if params[:search_type]=="Search by subject"
      @tickets = Ticket.where(subject: params[:search_key])
    elsif params[:search_type]=="Search by keywords"
      sql = "SELECT t.* FROM tickets t JOIN ticketRequests r ON t.id=r.ticket_id WHERE "
      words = params[:search_key].split(" ").length>0 ? params[:search_key].split(" ") : params[:search_key]
      words.each_index do |idx|
        sql += "r.report like '%#{words[idx]}%' "
        sql+= "or " unless idx==words.length-1
      end
      @tickets = Ticket.find_by_sql(sql+";")
    elsif params[:search_type]=="Search by reference no."
      @tickets = Ticket.where(reference_no: params[:search_key])
    end
    
    respond_with @tickets
  end
  
  private
  
  def ticket_params
    params.require(:ticket).permit(:reference_no, :subject, :customer_name, :customer_email, :customer_department, :status, :user_id)
  end
  
  def ticket_request_params
    params[:ticket].require(:ticket_request).permit(:report, :ticket_id)
  end
  
  def beforeFilter
    # Used by Mailer to generate dynamic absolute ticket URL's
    $request = request
  end
end
