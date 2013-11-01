# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    email "ting@ting.com"
    token "32characters"
  end
end
