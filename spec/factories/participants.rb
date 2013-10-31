# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    token "32characters"
    event
  end
end
