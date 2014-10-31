class AppMailer < ActionMailer::Base 
  include AbstractController::Callbacks
      
  def confirmation_email ticket
    @ticket=ticket
    base_url = root_url(only_path: true)
    @link = "http://localhost:3000/tickets/show?ref="+@ticket.reference_no
    mail(to: @ticket.customer_email, subject: "Confirmation Ticket")
  end
    
end
