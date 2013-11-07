# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
  	provider 'twitter'
  	uid "uid"
    token "token"
    token_secret "token secret"
    stripe_publishable_key "stripe"
  end
end
