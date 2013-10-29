require 'spec_helper'

describe 'Participant' do
	it 'should be able to RSVP' do
		participant = create(:participant)
		event = create(:event)

		visit edit_event_participant_path(event, participant)
		click_button "Yes"
		expect(page).to have_content "Your response has been updated"
	end

end