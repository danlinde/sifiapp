require 'spec_helper'

describe 'Participant' do
	before (:each) do
		event = create(:event)
		participant = create(:participant)	
		visit participant_token_path(event, participant.token)
	end

	it 'should be able to decline invitation' do
		click_button "No"
		expect(page).to have_content "Your response has been updated"
	end

	it 'should be able to accept invitation' do
		click_button "Yes"
		expect(page).to have_content "Please pay the amount set by your event organizer to finalize your RSVP"
	end

end