# require 'spec_helper'

# def create_dinner
# 		@dinner = Event.create({name: "Dinner on Friday", description: "We are going to subway", deadline: "2013-11-08 13:00",
# 			participants_attributes: [:email => "dan@pan.com", :first_name => "dan", :last_name => "pan"]})
# end

# describe 'an invitation email to each participants' do

#   it 'is send when an event is created' do
#     expect { create_dinner }.to change { emails.count }.by @event.participants.count
#   end

#   context 'dinner has already been created' do

#   	before(:all) { create_dinner }

# 	  it 'should have subject "An Invitation"'  do
# 	  	expect(emails.last.subject).to eq "An Invitation"
# 	  end

# 	  it 'should include the link of the event page' do
# 	  	 expect(emails.last.body).to include event_participant_path(@dinner, @dinner.participants.last)
# 	  	    # has_xpath?('//table/tr')
	  	    
# 	  end  

  # end

# end