class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  before_create :generate_reference_no, :set_status
  after_create :send_confirmation_email

  #enum status: [ "Waiting for Staff Response", "Waiting for Customer", "On Hold", "Cancelled", "Complete" ]
  
  def generate_reference_no
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    ref_no = ''
    3.times do |round|
      ref_no += chars[rand(chars.size)]+chars[rand(chars.size)]+chars[rand(chars.size)]
      ref_no += "-"+SecureRandom.hex(1)+"-" unless round>=2
    end
    self.reference_no=ref_no
  end

  def send_confirmation_email
    AppMailer.confirmation_email(self).deliver
  end

  def set_status
    self.status="Waiting for Staff Response"
  end
end
