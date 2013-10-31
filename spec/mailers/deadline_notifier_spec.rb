require "spec_helper"

describe "DeadlineNotifier" do
	before do
		event = FactoryGirl.create(:event)
	end

	it 'should send an email to the organizer when deadline is past' do
		expect { event.send_all_events_past_deadline}.to change { emails.count }.by 1
	end

	it 'should have subject "Deadline is past"'  do
  		expect(emails.last.subject).to eq "Deadline is past"
	end

	it 'should include the link of the event page' do
	  	expect(emails.last.body).to include event_path(event)	  	    
	end  

end
