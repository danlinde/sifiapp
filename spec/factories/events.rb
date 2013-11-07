# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyText"
    deadline "2014-10-28 11:35:44"
    amount 10.05
    organizer

    after(:create) do |event|
    	# FactoryGirl.create_list(:participants, 2, event: event)
	    event.participants << FactoryGirl.create(:participant)
	  end
  end

  factory :event_with_oauth, :parent => :event do
    name "MyString"
    description "MyText"
    deadline "2014-10-28 11:35:44"
    amount 10.05

    after(:create) do |event|
      # FactoryGirl.create_list(:participants, 2, event: event)
      event.participants << FactoryGirl.create(:participant)
      event.organizer = FactoryGirl.create(:organizer_with_oauth)
    end
  end

end
