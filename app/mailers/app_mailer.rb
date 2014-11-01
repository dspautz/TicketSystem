class AppMailer < ActionMailer::Base 
  include AbstractController::Callbacks
      
  def confirmation_email ticket
    @ticket=ticket
    p $request
    base_url = $request.env['HTTP_REFERER']
    @link = base_url+"tickets/show?ref="+@ticket.reference_no
    mail(to: @ticket.customer_email, subject: "Confirmation Ticket")
  end
    
end
