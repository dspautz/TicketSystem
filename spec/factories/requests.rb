# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_request, :class => 'TicketRequests' do
    report "MyString"
    ticket_id ""
  end
end
