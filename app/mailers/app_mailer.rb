class AppMailer < ActionMailer::Base 
  include AbstractController::Callbacks
      
  def confirmation_email ticket
    @ticket = ticket
    @link = $request.env['HTTP_REFERER']+"tickets/show?ref="+ticket.reference_no
    mail(to: ticket.customer_email, from: smtp_settings[:from], subject: "Confirmation Ticket")
  end
    
end
