class TicketRequest < ActiveRecord::Base
  belongs_to :ticket
  before_create :set_status
  after_create :send_confirmation_email
  
  def send_confirmation_email
    AppMailer.confirmation_email(self.ticket).deliver
  end

  def set_status
    self.ticket.status="Waiting for Customer"
  end
end
