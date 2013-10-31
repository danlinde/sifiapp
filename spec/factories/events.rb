# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyText"
    deadline "2012-10-28 11:35:44"
    organizer
  end
end
