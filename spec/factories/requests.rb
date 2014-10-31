# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request, :class => 'Requests' do
    report "MyString"
    ticket_id ""
  end
end
