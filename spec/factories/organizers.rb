# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organizer do
  	email "a@a.com"
    password "test1234"
  end

  factory :organizer_with_oauth, :parent => :organizer do
    email ''
    authentications [ FactoryGirl.build(:authentication) ]
  end
end
