require 'spec_helper'

describe 'Participant' do
	it 'should be able to RSVP' do
		event = create(:event)
		participant = create(:participant)
		
		visit participant_token_path(event, participant.token)
		click_button "Yes"
		expect(page).to have_content "Your response has been updated"
	end

end