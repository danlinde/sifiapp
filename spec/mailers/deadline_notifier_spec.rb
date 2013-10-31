require "spec_helper"

describe "DeadlineNotifier" do

	before(:each){ @event = FactoryGirl.create(:event)}

	it 'should send an email to the organizer when deadline is past' do
		expect { Event.send_all_events_past_deadline}.to change { emails.count }.by 1
	end

	it 'should have subject "Deadline is past"'  do
		Event.send_all_events_past_deadline
  		expect(emails.last.subject).to eq "Deadline is past"
	end

	it 'should include the link of the event page' do
		Event.send_all_events_past_deadline
	  	expect(emails.last.body).to include event_path(@event)	  	    
	end  

end
