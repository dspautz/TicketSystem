class TicketRequest < ActiveRecord::Base
  belongs_to :ticket
  before_create :set_status
  after_create :send_confirmation_email, unless: :skip_send_email
  
  def send_confirmation_email
    AppMailer.confirmation_email(self.ticket).deliver
  end

  def set_status
    self.ticket.ticket_status=TicketStatus.find_by(text: "Waiting for Customer")
  end
end
